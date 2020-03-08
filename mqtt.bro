global i = 1;
event packet_contents(c: connection, contents: string)
    {   
        print i, contents;
        if ((bytestring_to_count(contents[0]) & 0xf0) == 0x80) {
            print "This is a subscribe MQTT";
        }
    }
