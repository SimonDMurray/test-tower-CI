#!/usr/bin/env nextflow

nextflow.enable.dsl=2

process foo {

   input:
   val(x)

   output:
   path "*.txt"

   shell:
   '''
   echo !{x} > "!{x}.txt"
   '''
}

process bar {

   debug true

   input:
   path infile


   shell:
   '''
   cat !{infile}
   '''
}

workflow {
   ch = Channel.of('a', 'b', 'c')
   ch | foo | bar
}
