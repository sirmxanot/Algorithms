from datetime import datetime
import csv

def average_duration(start_path, stop_path):
    starts = {}
    durations = []
    time_format = '%m/%d/%Y %H:%M:%S'
    with open(start_path,'r',newline='') as starts_csv:
        starts_d = csv.DictReader(starts_csv)
        for record in starts_d:
            print(record)
            starts[record['ip']] = datetime.strptime(record['start_time'],time_format)

    with open(stop_path, 'r', newline='') as stops_csv:
        stops_d = csv.DictReader(stops_csv)
        for record in stops_d:
            if record['ip'] in starts:
                stop_time = datetime.strptime(record['stop_time'],time_format)
                time_delta = stop_time - starts[record['ip']]
                durations.append(time_delta.seconds)

    return sum(durations)/len(durations)



if __name__ == "__main__":
    print(average_duration('starts.csv','stops.csv') == 13.5)