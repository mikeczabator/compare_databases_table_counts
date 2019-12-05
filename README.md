# compare_databases_table_counts
compares MemSQL table count to Druid
```
[ec2-user@ip-172-31-6-127 ~]$ ./table_counts_formatted.sh
=============
MemSQL count:       664,187,069         ( delta since last run:  664,187,069 )
 Druid count:       91,322,529          ( delta since last run:  91,322,529 )

    diff of :       572,864,540


=============
MemSQL count:       664,542,786         ( delta since last run:  355,717 )
 Druid count:       91,373,764          ( delta since last run:  51,235 )

    diff of :       573,169,022


=============
MemSQL count:       664,942,784         ( delta since last run:  399,998 )
 Druid count:       91,373,764          ( delta since last run:  0 )

    diff of :       573,569,020


=============
MemSQL count:       665,160,347         ( delta since last run:  217,563 )
 Druid count:       91,373,764          ( delta since last run:  0 )

    diff of :       573,786,583
```
