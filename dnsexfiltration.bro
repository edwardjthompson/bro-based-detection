# redef DNS::Exfiltration = 10;

NOTICE([$note=10,
        $msg="DNS Query too long"),
        $src="src",
        $identifier="id"]);


event dns_request(c: connection, msg: dns_msg, query: string, qtype: count, qclass: count)
    {
        # print "c\n";
        # print c;
        # print "msg\n";
        # print msg;
        # print "query\n";
        print query;
        print |query|;
        # print qtype;
        # print qclass;
        if ( |query| > 52 ) print "TOO LONG";
        if ( |query| > 52 ) Notice(10);
        # Notice::
    }



# event file_hash(f: fa_file, kind: string, hash: string)
#     {
#     if ( kind == "sha1" && f?$info && f$info?$mime_type &&
#          match_file_types in f$info$mime_type )
#         do_mhr_lookup(hash, Notice::create_file_info(f));
#     }