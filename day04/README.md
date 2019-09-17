Three different ways to view circuit results: display, monitor, and dump

- display and monitor show different techniques for printing to the terminal
- dump writes waveforms to a file that can be visualized graphically using GTKWave

Also includes simple Makefile example. TEST variable determines which option to run, and can also be provided on the command line:

```make run TEST=SR_latch-dump```
