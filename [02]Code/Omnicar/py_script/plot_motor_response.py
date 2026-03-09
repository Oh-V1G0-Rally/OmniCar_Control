import matplotlib.pyplot as plt
import csv
import argparse
import sys
import os

# Numero di righe da saltare all'inizio del file PRIMA dell'intestazione
SKIP_DATA_ROWS = 5

# Variabile per il percorso del file CSV da aprire
# Esempio Linux: "/media/user/Storage/Desktop_Ale/OmniCar_Control/[02]Code/Omnicar/py_script/csv_test/M0_T1.csv"
FILE_FOLDER_PATH = '/media/user/Storage/Desktop_Ale/OmniCar_Control/[02]Code/Omnicar/py_script/csv_test/'
FILE_NAME = 'MA_LO_T1.csv'
FILE_PATH = os.path.join(FILE_FOLDER_PATH, FILE_NAME)

def main():
    parser = argparse.ArgumentParser(description='Omnicar CSV Plotter')
    parser.add_argument('filename', nargs='?', default=FILE_PATH, help='Percorso del file CSV da analizzare')
    parser.add_argument('-s', '--separate', action='store_true', help='Genera 4 grafici separati (uno per motore)')
    args = parser.parse_args()

    if not os.path.isfile(args.filename):
        print(f"Errore: Il file '{args.filename}' non esiste.")
        print("Assicurati di aver specificato il percorso corretto.")
        sys.exit(1)

    print(f"--- ANALISI FILE: {args.filename} ---")
    
    # Liste per i dati
    times = []
    pwms = []
    motor_speeds = [[], [], [], []] # M0, M1, M2, M3
    headers = []

    try:
        with open(args.filename, 'r', newline='') as csvfile:
            # Salta le righe iniziali (es. log di debug prima del CSV)
            for _ in range(SKIP_DATA_ROWS):
                csvfile.readline()

            # Leggi la riga dell'intestazione per rilevare il delimitatore
            header_line = csvfile.readline()

            if not header_line:
                print("Errore: Il file non contiene dati validi dopo le righe saltate.")
                sys.exit(1)

            try:
                # Usa csv.Sniffer per identificare automaticamente il delimitatore
                dialect = csv.Sniffer().sniff(header_line, delimiters=';,')
                detected_delimiter = dialect.delimiter
            except csv.Error:
                detected_delimiter = ';' if ';' in header_line else ','
            print(f"Delimitatore rilevato: '{detected_delimiter}'")

            # Parsiamo l'intestazione dalla riga appena letta
            headers = next(csv.reader([header_line], delimiter=detected_delimiter))
            print(f"Intestazioni rilevate: {headers}")

            # Crea il reader per il resto del file (parte dalla posizione corrente)
            reader = csv.reader(csvfile, delimiter=detected_delimiter)

            # Lettura righe
            for i, row in enumerate(reader):
                if not row: continue # Salta righe vuote
                try:
                    # Struttura attesa: Time_ms;PWM_Ref;Spd_M0;Spd_M1;Spd_M2;Spd_M3
                    t = float(row[0].replace(',', '.'))
                    pwm = float(row[1].replace(',', '.'))
                    m0 = float(row[2].replace(',', '.'))
                    m1 = float(row[3].replace(',', '.'))
                    m2 = float(row[4].replace(',', '.'))
                    m3 = float(row[5].replace(',', '.'))
                    
                    times.append(t)
                    pwms.append(pwm)
                    motor_speeds[0].append(m0)
                    motor_speeds[1].append(m1)
                    motor_speeds[2].append(m2)
                    motor_speeds[3].append(m3)

                except ValueError:
                    # Ignora righe che non contengono numeri validi (es. fine file o errori)
                    continue

    except Exception as e:
        print(f"Errore durante la lettura del file: {e}")
        sys.exit(1)

    if not times:
        print("Nessun dato valido trovato nel file.")
        sys.exit(1)

    # --- CREAZIONE GRAFICO ---
    print(f"Generazione grafico con {len(times)} punti...")
    
    if args.separate:
        # Modalità 4 grafici separati
        fig, axs = plt.subplots(2, 2, figsize=(12, 8))
        fig.suptitle(f"Analisi Motori Separata: {os.path.basename(args.filename)}")
        
        # Appiattisci l'array degli assi per iterare facilmente
        axs_flat = axs.flatten()
        
        for i in range(4):
            ax = axs_flat[i]
            color_speed = f'C{i}' # Colore diverso per ogni motore
            
            # Asse Y1: Velocità Motore
            ax.plot(times, motor_speeds[i], color=color_speed, label=f'Speed M{i}')
            ax.set_ylabel(f'Speed M{i} (rad/s)', color=color_speed)
            ax.tick_params(axis='y', labelcolor=color_speed)
            ax.grid(True, linestyle='--', alpha=0.6)
            
            # Asse Y2: PWM Reference
            ax2 = ax.twinx()
            ax2.plot(times, pwms, 'k--', alpha=0.3, label='PWM Ref')
            if i % 2 == 1: # Solo sui grafici a destra per pulizia
                ax2.set_ylabel('PWM', color='k')
            
            ax.set_title(f'Motore {i}')
            
        # Etichetta asse X solo in basso
        for ax in axs.flat:
            ax.set_xlabel('Time (ms)')

    else:
        # Modalità grafico unico sovrapposto
        fig, ax1 = plt.subplots(figsize=(12, 6))
        
        ax1.set_xlabel('Time (ms)')
        ax1.set_ylabel('Speed (rad/s)')
        
        for i in range(4):
            ax1.plot(times, motor_speeds[i], label=f'Speed M{i}', linewidth=1.5)
            
        ax1.legend(loc='upper left')
        ax1.grid(True, linestyle='--', alpha=0.6)
        
        # Asse Y2 per PWM
        ax2 = ax1.twinx()
        ax2.set_ylabel('PWM Reference', color='k')
        ax2.plot(times, pwms, 'k--', linewidth=1, alpha=0.5, label='PWM Ref')
        ax2.legend(loc='upper right')
        
        plt.title(f"Analisi Combinata Motori: {os.path.basename(args.filename)}")

    fig.tight_layout()

    # Gestione chiusura esplicita con tasto 'q'
    def on_key(event):
        if event.key == 'q':
            print("Chiusura grafico...")
            plt.close(fig)
            
    fig.canvas.mpl_connect('key_press_event', on_key)

    print("\n>>> Grafico aperto. Premi 'q' sulla finestra o chiudila per terminare. <<<")
    plt.show()

if __name__ == "__main__":
    main()