# type DNS::Exfiltration

event dns_request(c: connection, msg: dns_msg, query: string, qtype: count, qclass: count)
    {
        print c;
        print query;
        print |query|;
        if ( |query| > 52 ) print "TOO LONG";
        if ( |query| > 52 ) {
            print c$orig_h;
            print query;
        }
        # if ( |query| > 52 ) {
        #     NOTICE([$note=DNS::Exfiltration,
        #     $msg=fmt("Long Domain. Possible DNS exfiltration/tunnel by %s. Offending domain name: %s", "c$ip", query)]);
        # }
    }