#!/bin/bash
file="./hosts"
not_ip() {
  rx='([1-9]?[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])'

  if [[ $1 =~ ^$rx\.$rx\.$rx\.$rx$ ]]; then
    return 0
  else
    return 1
  fi
}
while IFS=: read -r val
do
    if not_ip $val;
    then 
        # display val is it is ip
        val=$(echo "$val" | tr -s " ")
        val=${val%% }
        val=${val## }
        printf 'IP address: %s\n' "$val"
        echo "yes \n" | ssh-copy-id -i ~/.ssh/allainmoyo "dell@$val -y"
    fi
done <"$file"
