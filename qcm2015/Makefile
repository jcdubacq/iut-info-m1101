students.csv: students-scodoc.csv
	head -n 1 students-scodoc.csv > students.csv; sort -t, -k4,4 -k2,2 students-scodoc.csv |grep -v ^ID >> students.csv
