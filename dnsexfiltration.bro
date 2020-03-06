# type DNS::Exfiltration

event dns_request(c: connection, msg: dns_msg, query: string, qtype: count, qclass: count)
    {
        print query;
        if ( |query| > 52 ) {
            print "TOO LONG";
            print |query|;
            print c$id$orig_h;
        }
        if ( |query| > 52 ) {
            NOTICE([$note="DNS::Exfiltration",
            $msg=fmt("Long Domain. Possible DNS exfiltration/tunnel by %s. Offending domain name: %s", c$id$orig_h, query)]);
        }
    }