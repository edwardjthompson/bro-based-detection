global i = 1;
event packet_contents(c: connection, contents: string)
    {   
        print i, contents;
        if (bytestring_to_count(contents[0]) == 0x82) {
            print "This is a subscribe MQTT";
            local j = 0;
            for (x in contents) {
                print j, x;
                j += 1;
            }
            local position = 1;
            while (T) {
                print "while";
                local length = contents[position];
                print bytestring_to_count(length);
                break;
            }
            
            
        }
    }
