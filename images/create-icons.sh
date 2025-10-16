#!/bin/bash
colors=("top:ff6b6b" "up:4ecdc4" "charm:95e1d3" "bottom:feca57" "down:48dbfb" "strange:ff9ff3")
for item in "${colors[@]}"; do
  IFS=':' read -r name color <<< "$item"
  for state in UP HOVER; do
    opacity="0.8"
    [ "$state" = "HOVER" ] && opacity="1.0"
    cat > ${name}-${state}-olon-120.svg << ENDSVG
<svg width="120" height="120" xmlns="http://www.w3.org/2000/svg">
  <circle cx="60" cy="60" r="50" fill="#${color}" opacity="${opacity}"/>
  <text x="60" y="70" text-anchor="middle" fill="white" font-size="14" font-weight="bold">${name^^}</text>
</svg>
ENDSVG
  done
done
