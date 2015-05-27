import sys
import bisect

def my_median(lst):
	if len(lst) < 1:
		return None
	if len(lst) %2 == 1:
		return lst[((len(lst)+1)/2)-1]
	else:
		return float(sum(lst[(len(lst)/2)-1:(len(lst)/2)+1]))/2.0
	
def main():
	print "Starting trim script"
	input_files = []
	for i in range(1, len(sys.argv)-1):
            input_files.append(open(sys.argv[i], 'rb'))
            
        print len(input_files)
        out_file = open(sys.argv[len(sys.argv)-1], 'wb')
        header = ''
        
        for file in input_files:
            print file.name
            header = file.readline()
            print header
        
        out_file.write('\"TimeStamp\",\"POWER\"\n')
        
        for line in input_files[0]:
            #print line.split('\",\"')
            date = line.split('\",\"')[0]
            power = float(line.split('\",\"')[2])
            for fil in input_files[1::]:
                lin = fil.readline()
               # print "++" +lin
                lines = lin.split('\",\"')
                power+= float(lines[2])
            out_file.write(date + "\",\"" + str(power) + "\"\n")
            power = 0
	#print testm.readline()
	#counter = 0
	#first_val = 0;
	#lastval = ""
	#first_line = 1
	#values = [[] for x in range(13)] 
	#out_file = open(sys.argv[2], "wb")
	#with open(sys.argv[1], 'rb') as inobj:	
		#for line in inobj:
			#print line
			#strings = line.split(";")
			#if first_line:
				#first_line = 0
				#out_file.write(line)
				#continue
			#if not counter:
				#first_val = strings[0]
				#lastval = strings[14]

			#for i in range(0,13):
				#values[i].append(float(strings[i+1]))
	
			#if counter < 20000:
				#counter+=1
			#else:
				#counter = 0
				#my_rez = first_val + "; "
				#for i in range(0,13):
					#values[i].sort()
					#my_rez = my_rez + str(my_median(values[i])) + "; "
					#values[i] = []
				#my_rez += lastval.strip()
				#out_file.write(my_rez + "\n")
				#print my_rez
	#out_file.close()

if __name__ == "__main__":
	main()
