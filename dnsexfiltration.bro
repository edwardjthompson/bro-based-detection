type DNS::Exfiltration




event dns_request(c: connection, msg: dns_msg, query: string, qtype: count, qclass: count)
    {
        print query;
        print |query|;
        if ( |query| > 52 ) print "TOO LONG";
        if ( |query| > 52 ) NOTICE([$note=DNS::Exfiltration,
                            $msg="DNS Query too long",
                            $src="src",
                            $identifier="id"]);
    }