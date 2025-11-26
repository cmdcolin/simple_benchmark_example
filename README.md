# simple benchmark example using vitest bench to compare branches

When you're working on a branch, you can run "yarn bench" and it'll
automatically compare your current branch against master

See https://cmdcolin.github.io/posts/2025-11-24-simplebench/

## Output

Checkout the newpow branch and run "yarn bench"

```


 DEV  v4.0.14 /home/cdiesh/src/simplebench


 ✓ benchmarks/pow.bench.ts > pow 9251ms
     name              hz     min     max    mean     p75     p99    p995    p999     rme  samples
   · main    3,284,632.90  0.0001  2.7676  0.0003  0.0003  0.0006  0.0006  0.0007  ±1.10%  1642317
   · newpow  3,164,030.26  0.0002  0.0631  0.0003  0.0003  0.0005  0.0006  0.0007  ±0.13%  1582016

 BENCH  Summary

  main - benchmarks/pow.bench.ts > pow
    1.04x faster than newpow

```

## Analyze cpuprofile

```
node --cpu-prof profile.ts
npx speedscope *.cpuprofile
node analyze_cpuprof.ts *.cpuprofile
```
