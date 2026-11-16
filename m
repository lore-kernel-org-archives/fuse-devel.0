Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794828676;
	b=D3I0j2g8rn0wao15Vknov8n9pLNSVuJXO0mL5qjhOpUjqPCdsgarV8gq+Sa/+7tyael1
	 dP28Fr0AsJmHhX0kDcHd2ztzoO3Bet1tvLxcakGZJH85rHpaaIuJqkhE/3v4CzYczCFe6
	 oz88XMRm5xo5pHfEXNw1HcQOmE47Jam6or4nKrWEyTTtolPYz/3WJ+SfgmAVm3/Gn1VVw
	 dpEmX5DR5OHc7QOwGWg/qFEsOhCE86nM5peHLzAqbXIndv1I26BsdcfBfdK6X5HA/q+vc
	 LALkgBAp544EsFNaOm/rPZK1WdidltSZZEEY9xSySYPDPV0av4ny/HIoAUmki68Rsjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=wtSeKpS27rBmoNgRnmtk6Fl68DcVUzwroJjv5Gt9KJo=;
	b=yQV167hcDc+up+ZO0Mg4rrd1bv4vUHEGmKDj/r95ISEXKmQdxbRyfEmpKpzRgbKF3pVp
	 3sByCP+Fp0Dtdxehh4/ECfFW2IMJi+ZJpg3CewAKqyt2BGq54ZM/cbW0MNhjpwWGWxZTg
	 hJwvc9H5M1m5O19cHDtNss8ZXZgQaB4nI2g9TQ+gCYciyrW3N0F1v17+wVDRIK4LP/mW3
	 JbS21g/c7i8d9DnWHX+RfSMjs0cmozac8+qzxkU3hl1kBjJV2fhwIfU/gdpFzCfaG4muA
	 QPKpImpV/6cgkr4Ymfz3XbmvMIbAawAqrQWikiysCf+9VNg/Ud1s77U1iN4uywKH49Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0iEnr1BD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FECE606A32A
	for <fuse-devel@lists.linux.dev>; Mon, 16 Nov 2026 11:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FECE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0iEnr1BD
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3adfe77d336so33282101fa.1
        for <fuse-devel@lists.linux.dev>; Mon, 16 Nov 2026 03:31:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794828674; cv=none;
        d=google.com; s=arc-20260327;
        b=sUz/TjQPW1QwElwQVKdx6Z3NsDjvppg+P109X6Jw6Q94NNm6+FRvzHc58YULv48qNT
         TpLeIoDce2ZBaQulHQQbt7PGzJFobCsiBYeOW9SVu3TPJcoClJ0YBD8FEwx+/TddNUrT
         SjbKp5JA1H2BBzroWOEF/sv+5LQQrzFowYPhmoI6nMtzKl9gWSCQMXC0A8SIF7F5gcko
         Km1M11pXG8s4kRpSQ2wLYSO6vTj/ahEtkJzSdt2Uj/JC+wuIAUOuc7mjLiczOW3rf+yJ
         y9RWjxk/+hIEed0hs9ykTSI47qgcIhP9gsjmrKScfxj+Jxz+zylrs9O++DuKejuy5P2t
         qsUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wtSeKpS27rBmoNgRnmtk6Fl68DcVUzwroJjv5Gt9KJo=;
        fh=IaWCKst8Qo70Hq20sb5Quow9HLqy5WZ6/dCZPYqG6qg=;
        b=fL8iHau12dXQlqASaucDdOxKVuqGrnTUltqoFgoiUOraPL9s9vhcoXTbg3Ldjl60xc
         6ZZZtrkasJeoWIvO7pNw1hcKBesueZTMBn4wplHNNk2N/+c9l052SlzxJFFokeB6YNeY
         aC+JhJmazh+2vVdOdnUN7bDuU2OPxOTr4Evi3I4SQ4Xc0EWv+pTTcaRkioTu98ctpnwU
         I6G1VvbEmKlBwSWbwkxqk0MZ495mupiNyB9MOhvA4lv7xqA8zsN7KaBBDjAaQ31goF5n
         +UrRf7KKgwreyLRjX1F5sb7EL+CI+8qmKqfFY8xjrjxjwy6cwMzUiDi04RIlnTVn96VJ
         Om/A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794828674; x=1795433474; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wtSeKpS27rBmoNgRnmtk6Fl68DcVUzwroJjv5Gt9KJo=;
        b=0iEnr1BDO3JzV6izyuln+2yWXdNce88K4cTfL7cx/vJO9GRPzwo9arzrxAuvpECr6B
         bHShbgncNUd/4UxddyIyJpUfzOcd27IiyEjb+z/XzPWxm00MPDLqMJbLW4VvJ/rgQwL4
         7LQ1+SMTt0Pfv8yDklGqJiKuOt21/ltXNGsC0qVe1UG7kW8yV6XqiZrOaUZbimjVLCfK
         JNe/IoWYv8ZoE66XqkHLW3iKt3wDRD4TuvQVpNUYZVP4pYAHSEBQP0OPFzIbRm12ZNdt
         a/8ChvsdalmwYr1FpC+R8JzDFSFobdEhKWzV2AIvTxdExgW5Tks01FD89OfwTuNd/gUW
         kJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794828674; x=1795433474;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wtSeKpS27rBmoNgRnmtk6Fl68DcVUzwroJjv5Gt9KJo=;
        b=DEI/cEul7sztHWEN2aLeK6tUBKlVy1T+jZVGThRfTZH06jJA6a/wVTzReErQecwr3h
         +GBHORY5zXzZzTa30/8OYu3DuZZkBEs7FbBwKizNfyOOila9YqDBw8obdzHvb5r+qFWG
         1rRt5Mr8bYh1OMz8NxjkONTtZ/Ug3mJj+26h0aYEXksT8KniOwjebsEUqCM3jeM57J8d
         GDyKPQy4dF/B0HjqQJPJ9pupmspzeoXTlP/V48MYm1Sc7/0yoRM/BBPLOclur57WgsSP
         0/unaRSChSXiWhVgV8A2N6S25LvqruzIsY+Exx1OyaObkdMj9NFXZCNQFyBqS/sst920
         qFLw==
X-Forwarded-Encrypted: i=1; AL+hErGjofUly4K5/3ZL3VPeoNJQVVB9bqvvpGEzKcpv50pizaD00sePM5X1L0qwlz8yQSxE+GwFhGaF0eZI@lists.linux.dev
X-Gm-Message-State: APuU4Z+9DgFcndDoyJ9cRPmTs+yHpbIbgpe7w8Q4o3X6fcdddpp3b7RY
	gLMUnlsRFzYjPRjeb+spCnqqf4RS9fgpl9WUUIYGuJgL0saPpDzxnKyAudlXawN8GyhifVFg4jc
	7v+u0pfeOQtPTgaexRDgwCfY/BJTrmg0=
X-Gm-Gg: AYBFou3NnXXUvGR4IlQGO32PcOqHq5Vq9ZwyhvT3Ji0Bs+a03E93c4L802q8wlFY/OF
	ndh+VRWiMx8EcIol5yy589p/wOlzxmmeaG3idBi5StAAppAnRbpTBUAq9/RNrV02X+2iGO+hZo9
	qDlwbQjfbd29bUOU+eMNS1+eryPZhjDa3ePOs6VpGonJiC00pGuYUFupB/NKCNiiOkzHmuEKTpS
	ThIu1K32TVAD7FYJkB4dmWUSl/5zCLjME3v5FkRMubYTDK1BnV6iDS45M5dv+x1A/G6V2890sHt
	QBqFGI1frLdUtkT/S3qCXJBylkuOSKoJmkJ75Nk5josOAzO/vFS1UUEaPiyLGIL1DOHGI6E0NVX
	sCETJw3pr2ffM8RNeRgyFdhwtrp2faVenPOERag==
X-Received: by 2002:a05:651c:a344:b0:3ac:ff0a:9d86 with SMTP id
 38308e7fff4ca-3ae2b4bad81mr32453821fa.15.1794828674271; Mon, 16 Nov 2026
 03:31:14 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115210952.2140036-1-graypanda.inzag@gmail.com>
 <20261115210952.2140036-2-graypanda.inzag@gmail.com> <CAOQ4uxhZS1w24GXWphu-PNPbGxVJUDwOfqHdRZcb05+_HVv=aA@mail.gmail.com>
In-Reply-To: <CAOQ4uxhZS1w24GXWphu-PNPbGxVJUDwOfqHdRZcb05+_HVv=aA@mail.gmail.com>
From: Junyoung Jang <graypanda.inzag@gmail.com>
Date: Mon, 16 Nov 2026 20:31:00 +0900
X-Gm-Features: Aa3M54qrozvfFSvQ0gfAb_mSn86pOQYMr6gnIKh6TI_Xntwk7Flfv7qM72l-pE8
Message-ID: <CAO7ntTRdY+5G1wiETFu0SVa3vFX+0RyMO6R5XpoosF0zhuoQYw@mail.gmail.com>
Subject: Re: [PATCH 1/3] fuse: reject embedded NULs in readdir entry names
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Jan Kara <jack@suse.cz>, Matt Bobrowski <matt@bobrowski.net>, 
	Gwanhyun Lee <gwanhyunlee@gmail.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2026 at 7:25 PM Amir Goldstein <amir73il@gmail.com> wrote:
>
> On Sun, Nov 15, 2026 at 10:10 PM Junyoung Jang
> <graypanda.inzag@gmail.com> wrote:
> >
> > parse_dirfile() and parse_dirplusfile() reject '/' in dirent->name, but
> > do not check for embedded NUL bytes.
> >
> > Unlike plain getdents() buffers covered by verify_dirent_name() in
> > fs/readdir.c, FUSE READDIRPLUS passes dirent->namelen directly to
> > QSTR_INIT() in fuse_direntplus_link() and instantiates or aliases live
> > dentries via d_splice_alias(). A dirent name containing an embedded NUL
> > produces a dentry whose d_name.len extends past the NUL terminator,
> > which allows callers such as inotify to copy uninitialized kernel slab
> > memory past the NUL byte to userspace.
> >
> > Reject dirent names containing NUL alongside '/' in the FUSE readdir
> > parsers.
>
> My concern is that there are innocent buggy servers that pass NUL
> maybe even because of length including the terminating NUL.
>
> It would be more considerate to make this check in fuse_direntplus_link()
> rather than to fail the readdir.
>
> See precedent in:
> 78d04af4995a1 NFS: nfs_prime_dcache must validate the filename
>
> Also, verify_dirent_name() never checks for embedded NUL, so all the
> other filesystems can get away with this without failing readdir.
>
> Thanks,
> Amir.

Hi Amir,

That makes sense, breaking getdents() for FUSE servers that include a
trailing NUL in namelen is definitely a real risk.

In v2, I will drop the parser checks and instead have
fuse_direntplus_link() return 0 early when memchr(name.name, '\0',
name.len) is non-NULL, skipping dcache instantiation without failing
readdir (matching the nfs_prime_dcache() precedent).

Thanks,
Junyoung
