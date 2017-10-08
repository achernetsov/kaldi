#!/bin/bash

# online recognition for kaldi-ru-0.2 (all credits to Nikolay Shmyrev)a

export KALDI_ROOT=/home/artyom/projects/lab/kaldi

export PATH=$PWD/utils:$KALDI_ROOT/src/bin:$KALDI_ROOT/tools/openfst/bin:$KALDI_ROOT/src/fstbin:$KALDI_ROOT/src/gmmbin:$KALDI_ROOT/src/featbin:$KALDI_ROOT/src/lm:$KALDI_ROOT/src/sgmmbin:$KALDI_ROOT/src/sgmm2bin:$KALDI_ROOT/src/fgmmbin:$KALDI_ROOT/src/latbin:$KALDI_ROOT/src/nnetbin:$KALDI_ROOT/src/nnet2bin:$KALDI_ROOT/src/online2bin:$KALDI_ROOT/src/ivectorbin:$KALDI_ROOT/src/lmbin:$KALDI_ROOT/src/chainbin:$KALDI_ROOT/src/nnet3bin:$PWD:$PATH:$KALDI_ROOT/tools/sph2pipe_v2.5
export LC_ALL=C

online2-wav-nnet3-online-feature-pipeline --do-endpointing=false \
    --global-cmvn-stats=online_cmvn.stats \
    --mfcc-config=conf/mfcc.conf \
    --frame-subsampling-factor=3 \
    --frames-per-chunk=60 \
    --extra-left-context-initial=0 \
    --online=true \
     --max-active=10000 --beam=12.0 --lattice-beam=6.0 \
     --acoustic-scale=0.9 --word-symbol-table=exp/tdnn/graph/words.txt \
     exp/tdnn/final.mdl exp/tdnn/graph/HCLG.fst \
      "ark:echo utterance-id1 utterance-id1|" "scp:echo utterance-id1 decoder-test.wav|" ark:/dev/null

