event dns_request(c: connection, msg: dns_msg, query: string, qtype: count, qclass: count%)
    {
        print query
        if ( |query| > 52 )
        do_mhr_lookup()
    }

# event file_hash(f: fa_file, kind: string, hash: string)
#     {
#     if ( kind == "sha1" && f?$info && f$info?$mime_type &&
#          match_file_types in f$info$mime_type )
#         do_mhr_lookup(hash, Notice::create_file_info(f));
#     }