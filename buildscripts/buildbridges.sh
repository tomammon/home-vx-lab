#!/bin/bash

bridges=(br103 br104 br105 br106 br107 br203 br204 br205 br206 br3010 br3011 br314 br324 br334 br4012 br5113 br5213 br5313 br6014 br6015 br617 br627 br637 br7014 br7015)

for bridgename in "${bridges[@]}"
do
	sudo nmcli conn add type bridge con-name $bridgename ifname $bridgename
done

