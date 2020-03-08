export {
    redef enum Notice::Type += {
        Mqtt::Subscribe,
    };
}

event packet_contents(c: connection, contents: string)
    {   
        local total_length = |contents|;
        if (bytestring_to_count(contents[0]) == 0x82) {
            # if the type is subscribe
            local position = 1; # starts at the first length
            while (position < total_length-2) {
                local length = contents[position];
                position += (bytestring_to_count(length) + 2);
                if (position == total_length + 1) {
                } else if (position > total_length){
                    return;
                }
            }
            # if it makes it here the lengths worked out
            position = 1;
            # checks for subscribe all (#) in the topics filter
            while (position < total_length-2) {
                local l = contents[position];
                position += (bytestring_to_count(l) + 2);
                if (contents[position-3] == "#") {
                    NOTICE([$note=Mqtt::Subscribe,
                    $msg=fmt("%s attempts to subscribe to all topics.", c$id$orig_h)]);
                }
            }
        }
    }
