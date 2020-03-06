type DNS::Exfiltration

event dns_request(c: connection, msg: dns_msg, query: string, qtype: count, qclass: count)
    {
        print c;
        print query;
        print |query|;
        if ( |query| > 52 ) print "TOO LONG";
        if ( |query| > 52 ) {
            NOTICE([$note=DNS::Exfiltration,
            $msg=fmt("Long Domain. Possible DNS exfiltration/tunnel by %s. Offending domain name: %s", "c$1", "c$2"),
            $src="src",
            $identifier="id"]);
        }
    }