Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793908147;
	b=Qv6ymcq+4BAGjWDOSM6ikB5WnV4D5fB9+NbBdAGCrUEU5Z8yTDxe7OTttNz/U1yPL+mG
	 ABqgpATPNONPPahqO9WZXEE0pWZZ6fFxvTh4x29d84csO52wYwrvwMM1SjYS4DqKY4HYS
	 SQsvBWN9wzUtTDBuRt+p4RSj/ujN7EzyCB3wASLRQmw6X9aL8SqWcsqmUEt7/8BA9FVBt
	 2W79HMNOLZ9zj2U1h0BqhT/s/TKpCBkfyRR4v6SugovE4990JifUNOOmp3iINAY37wdM9
	 4AFtXuUD01bq/KraJRihb0lQZcKkFb7Xf9scysj5QQTBDQU1h7WsJ/Hx4zA3rT4jYNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=N5scGhz5LxdwjNU1yVLwQJMho5xvAY73RNio+z9h7DA=;
	b=VWFDgXPPs7NLGCk5x6pJq3tAPMhnq8ph0HNtmaWoDJyt04qZEYGdcCgAD6uMNsi4CxjS
	 KettS3KkTed5AhklnlLkWRM7DD8dS4z2bkOQyNokBtdghc6Pk1ZX3rJwIdULfT5tZSAbJ
	 W5dLf3mWbydVfMyiQufnMc9hEauv7LEim83YCLwGDwcWNKfKhgD4YzZgFzFGzuI695yfe
	 B77aHG7Q+8xn2OZ5GP2G3awJl47B3DcLQs6sohN9BIbCw/qVmW5pHygk/K7Ztp5+ZFXMu
	 YyL9O2QkKBEDfGWSCD+Zh1YKBS1m9Wzka9yCGpLPIy7LOWMH/rqLKwgOBU9OFtu/K5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=databricks.com;
	spf=pass smtp.mailfrom=databricks.com;
	dkim=pass header.d=databricks.com header.i=@databricks.com header.a=rsa-sha256 header.s=google header.b=eReNVQbf;
	arc=fail smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E3D606E404
	for <fuse-devel@lists.linux.dev>; Thu,  5 Nov 2026 19:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54E3D606E404
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=databricks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=databricks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=databricks.com header.i=@databricks.com header.a=rsa-sha256 header.s=google header.b=eReNVQbf
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67c0ffaae1dso598442d50.1
        for <fuse-devel@lists.linux.dev>; Thu, 05 Nov 2026 11:49:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793908146; cv=none;
        d=google.com; s=arc-20260327;
        b=KwR4MLN6F7p+MSTV1U2tB2j/MTsjhoiovBNeIXtXGobmEZfJP+wgp57pI9+dh7P2ly
         VOuNsiOyTYt0TMgzTz7AOijAdDNxsf7KHdT8Tgyx335qT3SR3MpT8PUeeS+QHAU41geo
         r/XJZ/zRyjJwFruARXb5iyXvocdhrqnyr/xda2w/+LTL4BZ5PPsYMVPgkWHHN/qKEZzC
         rWRQCFK3O8FU8rG6BEsi0FAzTXfxEESBl7lOw+zdREFXV6heN4vLtGvXwjfjT+OjoGQj
         krqlRH8sDjDI45C0UdUifEDzhMjEbIq6fCbtbF42o2bZ1vsLyIVrLhQKWB+o/Je7rZiI
         k0vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=N5scGhz5LxdwjNU1yVLwQJMho5xvAY73RNio+z9h7DA=;
        fh=DjVsvvaEA9SP+2U8584+DUAt8JGkpRk7dkOJT9uxCOI=;
        b=SaRmOOr93QZ3zSvgta+HlVHV2deNlrd93lqLQFi+5lodUSD3t9inSs60l5bULuxNwi
         vjs/Wb6BjGPagi6F2cIqBuxvm49+ITW66JVjE/6W0t+0X1rYjCxWoMP0H187kv4+uxLS
         2oW13IqhhSS/rz5ZfDlRQxUwZy1gngu1HXMmBc8zsQhT2waPHZUGyArka+mpcT1MqKY4
         DFlevkl8tFO2JTUbcH8tqbpToR3mJm19traNz20ZjjnywKJuTP/E6lAWnQU21z1OiNST
         Yo04T16NlLBXF6SgxG6AfK7/M3WLNc+F0m0qgbYWS2lg3e30OoBnjCJZo6MQGZAQhbrg
         zBFw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=databricks.com; s=google; t=1793908146; x=1794512946; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N5scGhz5LxdwjNU1yVLwQJMho5xvAY73RNio+z9h7DA=;
        b=eReNVQbfylKPidokXel/uxx9TznMXa2Tn343OVMq5cAkeJbqE9Rytv4cmkCXeIEfId
         co2u3p3mBJblknfbsYd8+BtNmf+N1cWhb1VI+vffhXn3NiF/plBDQe5ecG80IY0YBe6S
         EagQqa6nGYPP+HzyuMBH3r4Ae92Rbua+knOB9ann5eUUnqoaclhg0GnvOz4mF3kU7Xnt
         ZNogUbJwiWNLsYo7pKerL/NuGYpWHcAUWGAokgjJjbI6251sqFOpt9IEvf2Rsug8fKvS
         M8TAjQcN3NSLlYle/6Gi2Gz4uVj+J4zq6kxd+IrxUskQVnTeHu6L0Qn3233uykDXc8xh
         BTtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793908146; x=1794512946;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=N5scGhz5LxdwjNU1yVLwQJMho5xvAY73RNio+z9h7DA=;
        b=cMDFpaMliTfC0K4Ni8DnhqT3LqMOk/ypIsUPMr7P1cna+TGSYw3kxeI3nzZDmsqf3f
         ZzB0YXcHtBQk9FwZE8WDgxCUj5Md6JTlU7bxzgIiVS3hri5ONy3PPgpZFPiPXLhxXuw2
         qCN15x1U0Md53zvoABmo+ngls1CQDuPCeAgs1BK31lgRFBpjnOk0uYahuvNVuph1kAQ7
         sqCJeRur3+Mn9YEQpv7YF5VA/BdxDB9L0f468U1AybMVFp+sgkuu5K9MqEdTCeHXqjwE
         qD6RnoRBBhaeRw+VNiBrpJjioZgAjmBzrO/9JEalQB2q+sJXbrcAPteUYLTYBml14qRU
         F2lQ==
X-Forwarded-Encrypted: i=1; AL+hErGM+ygmusR/Ujto5I01vRgu4h5lLN7ZbA3TFsNV983hEl2GzfMsGzeKs+bsbH3p8SRp70Df8lKK1ozT@lists.linux.dev
X-Gm-Message-State: APuU4Z8Jfkhk0IP4ZMF8L3pJzsgfxIXLTQMU17dtDBvzYm4P2jrZ+9wY
	veCDX91C1rfFYwDoSYBywvrJC6EHlLy+RxLzSM4JLHkExxAII8HUiBq6jpbD6SBtPH76vt8cCa1
	q6oGGspbBR9/iR9GsZ7g6cq8NTP1GBhDT+I7DqCX6mpP3nPlZGlNWDKU=
X-Gm-Gg: AYBFou38KOHiMtvEtnh1r++XGDMMPtle7mgxwukYv2iTqN4tZsTLpkvdcRt9S7wA8sX
	YQjgjGX07S/X3hZbSeoIJJpBNT+cxsRHSgpSQSCLZzkoNtc3W6oT9SoxLkABjKp+75mP7Bcaiq1
	hRCoT+mUMZtWOQqs1m85lDxRYFwiPKONEIb4WmdUBegwm7rPMl+QlbzeEvcxhiUoIGQx4EQ9aKo
	EPE8o9SOfFOvMBxopwXLMdLAwOjHuDQz99wH22CFhP0HAI5Z2k99TzWUeOtnDf8+0xSRp9G+BJW
	yzCiTOewxq5pzxxcdDN7yIH4VCD9q0hiBqohx78BHAnaS/VWn7JG1LaZL/6/upU4tNAXcmhycQ1
	DVLknQj/3orra8ohNzjIHynnbj8gQ32sRQoY=
X-Received: by 2002:a53:c045:0:10b0:673:e272:f3ec with SMTP id
 956f58d0204a3-67c03574d3cmr1676191d50.16.1793908146013; Thu, 05 Nov 2026
 11:49:06 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Lakshita Jain <lakshita.jain@databricks.com>
Date: Thu, 5 Nov 2026 11:48:53 -0800
X-Gm-Features: AclHuK86O9Kk2D4NIGqxQ7jet_z__LeBB-Hzqe3C7yoJqWGYxhQHMmpa1pCI8qQ
Message-ID: <CALE1rk6tGt_Pe7CpFL1NSTgugVpXLH_iguO2D9VsAVHn1p-02w@mail.gmail.com>
Subject: [REGRESSION] fuse: non-owner POSIX ACL writes get EPERM before
 reaching daemons without default_permissions (since 6.2)
To: brauner@kernel.org, miklos@szeredi.hu
Cc: sforshee@kernel.org, linux-fsdevel@vger.kernel.org, 
	fuse-devel@lists.linux.dev, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Christian, Miklos,

Since 6.2, a non-owner setting system.posix_acl_access on a
host-mounted FUSE filesystem gets EPERM before the request reaches the
daemon, when the daemon does not set FUSE_POSIX_ACL and is mounted
without default_permissions. Before 6.2 the write was passed through
and the daemon made the decision.

User-visible effect: on a FUSE filesystem that reports files as owned
by root and does its own permission checks, a non-root user running
"sed -i" gets "preserving permissions for './sedXXXXXX': Operation not
permitted", and "install -m 644" fails, even on files the user just
created. chmod on the same files works.

The check that rejects it is in set_posix_acl(), reached from
vfs_set_acl() since 318e66856dde ("xattr: use posix acl api"):

    if (!inode_owner_or_capable(idmap, inode))
            return -EPERM;
    ...
    return inode->i_op->set_acl(idmap, dentry, acl, type);

facd61053cff ("fuse: fixes after adapting to new posix acl api",
https://lore.kernel.org/all/20230118-fs-fuse-acl-v1-1-a628a9bb55ef@kernel.org/)
restored passing these ACLs through to daemons without FUSE_POSIX_ACL,
but this owner check still runs first. In v6.1, the same write went
through fuse_xattr_handler, and xattr_permission() places no VFS
restriction on system.* xattrs, so the daemon saw it.

For daemons without default_permissions, FUSE already leaves
permission decisions to the daemon for attribute changes:
fuse_setattr() sets ATTR_FORCE, so chmod/chown/utimes skip the VFS
owner checks. Would it make sense to treat POSIX ACL writes the same
way, i.e. not apply the owner check in set_posix_acl() for FUSE inodes
without default_permissions, and let the daemon decide? Happy to test
a patch.

Reproducer

libfuse's example/passthrough shows it, using libfuse's generic
uid=/gid= option to report every file as owned by root. As an
unprivileged user (mounted without default_permissions), in a
directory that user owns:

    $ ./passthrough -f -s -d -o uid=0,gid=0 /tmp/mnt 2>fuse.log &
    $ cd /tmp/mnt$HOME && echo hello > f.txt
    $ sed -i s/hello/hi/ f.txt
    sed: preserving permissions for './sedtTZojI': Operation not permitted
    $ install -m 644 f.txt g.txt
    install: setting permissions for 'g.txt': Operation not permitted
    $ echo $?
    1
    $ chmod 600 f.txt        # succeeds

fuse.log contains no SETXATTR request. Without -o uid=0,gid=0, both
commands succeed and fuse.log shows two SETXATTR requests for
system.posix_acl_access.

Tested on 7.0 (Ubuntu 7.0.0-1014-aws, libfuse 3.14.0). We see the same
failure on 6.8 hosts in production.

Thanks,
Lakshita Jain
Databricks
