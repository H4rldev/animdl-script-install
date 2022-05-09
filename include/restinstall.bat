@echo off
type %~dp0\logo.txt
choco install python;mpv
title Installing Anim-DL: [=====----]
refreshenv && pip install animdl && title Installing Anim-DL: [=========]