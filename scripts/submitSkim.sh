#!/bin/bash
DATE=`date +%Y-%m-%d`
if [ "$1" == "" ]; then
    NAME="$DATE"_Skim_MuMuTauTau_80X_v1
else
    NAME="$1"
fi
while read sample; do
    echo $sample
    if [[ $sample == *"Run2016H"* ]]; then
        #submit_job.py crabSubmit --publish --filesPerJob 6 --numCores 4 --maxMemoryMB 8000 --samples $sample --applyLumiMask "Collisions16" "$NAME" DevTools/Ntuplizer/test/MuMuTauTau_cfg.py isMC=0 crab=1 numThreads=4 runH=1
        submit_job.py crabSubmit --publish --filesPerJob 3 --numCores 2 --maxMemoryMB 4000 --samples $sample --applyLumiMask "Collisions16" "$NAME" DevTools/Ntuplizer/test/MuMuTauTau_cfg.py isMC=0 crab=1 numThreads=2 runH=1
        #submit_job.py crabSubmit --publish --filesPerJob 2 --samples $sample --applyLumiMask "Collisions16" "$NAME" DevTools/Ntuplizer/test/MuMuTauTau_cfg.py isMC=0 crab=1 numThreads=1 runH=1
    else
        #submit_job.py crabSubmit --publish --filesPerJob 6 --numCores 4 --maxMemoryMB 8000 --samples $sample --applyLumiMask "Collisions16" "$NAME" DevTools/Ntuplizer/test/MuMuTauTau_cfg.py isMC=0 crab=1 numThreads=4 runH=0
        submit_job.py crabSubmit --publish --filesPerJob 3 --numCores 2 --maxMemoryMB 4000 --samples $sample --applyLumiMask "Collisions16" "$NAME" DevTools/Ntuplizer/test/MuMuTauTau_cfg.py isMC=0 crab=1 numThreads=2 runH=0
        #submit_job.py crabSubmit --publish --filesPerJob 2 --samples $sample --applyLumiMask "Collisions16" "$NAME" DevTools/Ntuplizer/test/MuMuTauTau_cfg.py isMC=0 crab=1 numThreads=1 runH=0
    fi
done <DevTools/Ntuplizer/data/datasetList_Data_AOD.txt
while read sample; do
    echo $sample
    #submit_job.py crabSubmit --publish --filesPerJob 6 --numCores 4 --maxMemoryMB 8000 --samples $sample  "$NAME" DevTools/Ntuplizer/test/MuMuTauTau_cfg.py isMC=1 crab=1 numThreads=4
    submit_job.py crabSubmit --publish --filesPerJob 3 --numCores 2 --maxMemoryMB 4000 --samples $sample  "$NAME" DevTools/Ntuplizer/test/MuMuTauTau_cfg.py isMC=1 crab=1 numThreads=2
    #submit_job.py crabSubmit --publish --filesPerJob 2 --samples $sample  "$NAME" DevTools/Ntuplizer/test/MuMuTauTau_cfg.py isMC=1 crab=1 numThreads=1
done <DevTools/Ntuplize/data/datasetList_MC_AOD.txt
