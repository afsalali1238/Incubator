#!/bin/bash
# scripts/package.sh
# Run from repo root after any change to skills/

mkdir -p dist
cd skills/
powershell.exe -Command "Compress-Archive -Path project-ceo -DestinationPath ../dist/project-ceo.zip -Force"
mv ../dist/project-ceo.zip ../dist/project-ceo.skill
cd ..
echo "dist/project-ceo.skill updated"
