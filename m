Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018367;
	b=AlIx9+qI1BfhQlVNDljnOKL/cGuRudSEjcOh/5f3M3c7C2CB35YOFViqhbx8r0pu4bn4
	 XTL3qp4UwZ9RRSI1ms+eFeU3WnoPifYsUJWYE/jnT+vrsXfcxqomYZX6BM8I8UqPsO2xN
	 lyDR90s5Dna6is+IJHh4sQWMx0STqxkX0IjrdVd5a2mwWm3fBwDiCvZlZ3ZkV550R6ZEC
	 Tt9Vw+tnVGNl0/HQbbOQF1wgYQem9p7zc4zBotA3iPWfP5QvVbY3rT93sVg86XUiXRYah
	 cJWge3kzV02wASs73GS36HTso9WbTSMqUuYg6NKE/s0/zPJ1CcCCNQ3bMd89PTbAiDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018367;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=hRSk9PWo3l7cip8M+NykLS+PugK5xSdAKWB9NiIwz3Y=;
	b=Rp6O9T3vSRkOEFEFl5ZxeHYZltrILtPS5uPaZt1OHUip/4VazVMAta2JDcWwT6+5EBzH
	 JeRs+7+m5v5ifdh5Kr8vME3u165GNeUBvmd2sfY8vhHus58un62B9yUKOuW8DpnuXJntL
	 Ju8q5afQ6KigAhjDNMf6eiwFkK6t7SSKAy4hCoy/3N9FNZQ9sxAz7Xs22605c9YiVbvlP
	 X3WWKtBjhFxTnUiM2PzEW7bmLtWDUvbj98NjTx1AZLzpkvTr2w5J8/WvCrzcntSf89/hY
	 d0GAAHOfI2czEvRKL7eMdUOXufn4vBxiJFEd7j+2zbhHbI8xyZwz8LdDfBVxnfDL+OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bsbernd.com;
	spf=pass smtp.mailfrom=bsbernd.com;
	dkim=pass header.d=bsbernd.com header.i=@bsbernd.com header.a=rsa-sha256 header.s=fm2 header.b=FKoPEGYh;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=o+Pd2Y3+;
	arc=none smtp.remote-ip=103.168.172.152
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378DE606A33D
	for <fuse-devel@lists.linux.dev>; Wed, 18 Nov 2026 16:12:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 378DE606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bsbernd.com header.i=@bsbernd.com header.a=rsa-sha256 header.s=fm2 header.b=FKoPEGYh;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=o+Pd2Y3+
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4DDD41400126
	for <fuse-devel@lists.linux.dev>; Wed, 18 Nov 2026 11:12:44 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 18 Nov 2026 11:12:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795018364;
	 x=1795104764; bh=hRSk9PWo3l7cip8M+NykLS+PugK5xSdAKWB9NiIwz3Y=; b=
	FKoPEGYhjMWhl3WGRP8sIPkecho1U6CnqmwuvPEQH8SrY6wJVlfXH+ad5yFzHuri
	P/CJ7TMJYpdypapXWI5reygmP2N2kaeeoLXlXEk5rysKQmqjOrKG0w2PUYFQHqiT
	S78nDxROczFLWCm+ILv8WzxM9755ly7M8UekqLzbgpCqg2GfAAQ7eSUu7uTeg4sU
	WFX8asayuVm3TIM1q7cBzsGEaEEr83Vt8ld+l6QtkCUjl7n8ISJ9+OJXi/WPn692
	N17NW96UBBPi6HIeDPq2/91zAlMDEIPawmLMHrrHLjqc9aX51IFFDKYJd269WRuH
	jT2nDHzJy9OUsMI8DbboLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795018364; x=
	1795104764; bh=hRSk9PWo3l7cip8M+NykLS+PugK5xSdAKWB9NiIwz3Y=; b=o
	+Pd2Y3+NFwnZLqSLU0XbkgnCe6CJ2W+1B+H5Fw0PrqG4UUbqHNzpdxdQX3DZqFwk
	zJoVh610a3D4NCDufsASoNZQHCp+R2TxtP8JioavkiDu7ZDAwrUdNrGM+fCGa+yt
	tGMtM/oLbliV2fF0tudYcC9J0zMuHINUXgOFborqxA6GicP2q7o+krBarZTIJmJ3
	SkU6XgyfYXjvJS/wgYO/LSuly24JhQ6Mt2RCVsIW0oqvsKZEiFy76cT7W7pNkukY
	h6QcDrg7u7bkfTgsYX/fTcFjjLtLWlc+NY34pz70CBXRViwKmJ/+UL0lJf5+Ey5Y
	+Ykm+8wPsOg7P3IoHowIg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=bsbernd.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795018364; d=bsbernd.com;
	mf=PGJlcm5kQGJzYmVybmQuY29tPg==;
	rt=PGZ1c2UtZGV2ZWxAbGlzdHMubGludXguZGV2Pg==;
	s=fm2:rsa-sha256:H4NpLkybkFqdfpZyJwkp8Ct7GjOuC3FZzA05TcSLUfq11+2
	7lXOkseUyN/ThbOzjJC7WaRepHFlLWACFUuWb2Twl3FBayOzORlqiv0A8Dq3RS/j
	xZFWbUzIrTI+jXgGAlGqZDGA6+fVahmiqskuwalcr5G6NLAHDzqWlzptA11HhuQG
	/Fo0wh3jMxcQiZRV5RN2TJqPie9o/biGzGfxG2Z7yZLczj5hsBm2aAiO6BTTH8rP
	R0WmOiQHyMXwdA4y7ik6xnw6+8fybwzqQG+F/lqtZNSERD8weqikpunsc3xI1+gE
	p2VIIT44apBRViy6tcJ5lLh1vBWKIn3XuXt8bRQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,content-language,content-transfer-encoding,content-type,
	date,feedback-id,from,in-reply-to,message-id,mime-version,
	references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:7JpAOZ6Ns17U9x99cxxcvK7mWTs5of4tJJ1BQKKb2R8=:FjZsoo3+kdS9B+vPLRK6QtmCX3O6xqN1zYE1rxfhVSs=;
X-ME-Sender: <xms:fM79akhlGdWPHMjZkaeBTXzifD9YcrT_NvZfTKc1-EvVHv9BqNcSUg>
    <xme:fM79akfHAA0HQkowuI5bv4-Sr2y9e6SzrTLuqCgovgz8HeHM_XUIyRJD7w6onAIwG
    ImM8l6LMKw-PwhkdTsNxj_tAQ6sDOPPYKG9j1zcfeyk1dLsFzJeDw>
X-ME-Received: <xmr:fM79aperULh7eATWVFdKvu-mrDDJYRE5emKkIKQQVAVnyWRz-l2lXq2JRPTpOnXw2zgHJ2NEGCWfMsGGYG2WaCN25E8iWvygENttQQsRRrzWUUXeNg>
X-ME-Proxy-Cause: dmFkZTF9G9vNGxukzLrApEhD7vTXh70MbWAvlRLsh44ThhufnsA6JhbGwAJaMFadDvPlSl
    cpMYFiF/wTQ/CPY9ELGwRYk+xZyu9LVZwLYjZTyjRQ61ZqvR7Cyjm7RhYOoZUit1CJ1phz
    31yQ5hb8Wi26WdysXaAQ/6Z673HD4TxSY8LoSOXxmPJS3UqiFN63YB5NyoSzyo8W35u+r3
    pnXa2RNOpzwHhwK3nKUFFWVpve85X1VQaxcj2rONS5wJqS79hiE+fC1qbpPy/6jXmKSwIN
    TUaCWKxQzFU3udWFBdmgBgdtvjMVNqnEGyyXRIGjIYklm7IwhHsHyoTMsv/gY3TuT5r1CA
    Rtb/d2Z5r8FK/uJzCMpIUltpa2GztqnJ1dlfD09sOcn7fF4/PRZXYbQtuxbQc/a1KaBFZa
    e0bSFRGNZ2V7wfhYFZUCEoxCMwOh45OFMIxNw/9/iYraPz4Wa+4eGOc153EBZKm5aRdH0t
    BDCjPAZ1Nx8FOKbwM4Hyx5A/88uD/0DjnyPxJadoqqSnBwwZ2UdNcuCyeyBuiYjWI0c4+1
    Y8zAuyFacCO51S3OMGAVXsTRui4+fzEcalr1TlbpfG6nAFxwKELtPMuRY1t9jvf1QIs0kS
    T5byDLtwYcZGNGw0t7upMsNQIugwUCoCT1LT3ehJB1fTjI7BbO2hH2vOGOqw
X-ME-Proxy: <xmx:fM79au88gf5dAj3KYGAPcMADbqRRbA_8qb2lN0g_U2nFLZFzLZTKmQ>
    <xmx:fM79alkne1Je7cfwM94ZgKenEV5WzbzzSQXjvhjQ6ov0actlJE0J_w>
    <xmx:fM79ag84Z0JKfRdPLq1fgkR4AKtDJ7QGT9jWnER_TtpHHBj0UXt72A>
    <xmx:fM79ajli9x-tJiPKEsFkFzM5B8Z_rkmp_iE-0ptbaL-1T7Lgzs61sA>
    <xmx:fM79avxwwZ_7XrwitpK-YbBabGpUrPfaQOYQfzywkruoSYVq4gzO_4sJ>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Nov 2026 11:12:43 -0500 (EST)
Message-ID: <6fe0ae48-4760-4456-882f-e86937cc9e90@bsbernd.com>
Date: Wed, 18 Nov 2026 17:12:41 +0100
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fuse: fix use-after-free in fuse_create_open() error path
To: Jimmy Zuber <jamz@amazon.com>, Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev
References: <20261026180649.1265825-1-jamz@amazon.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20261026180649.1265825-1-jamz@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/26/26 19:06, Jimmy Zuber wrote:
> An open can still fail after fuse_finish_open() has succeeded. For
> example, an O_DIRECT open fails with -EINVAL if the file has no
> ->direct_IO method. By then the VFS has marked the file as open, so it
> releases the file itself, which calls fuse_release().
> 
> fuse_create_open() also frees the fuse_file whenever finish_open()
> fails, so fuse_release() then uses the freed fuse_file.
> 
> This happens when a file is created with O_DIRECT on a DAX inode that is
> opened for passthrough, because fuse_dax_aops has no ->direct_IO.
> 
> Only free the fuse_file in fuse_create_open() if the file was not
> opened.
> 
> Fixes: 2fbe4586cff3 ("fuse: add support for opening dax device as backing")
> Link: https://sashiko.dev/#/patchset/20261026151828.562870-1-jamz@amazon.com?part=1
> Assisted-by: Claude:claude-opus-5-5 [Claude-Code]
> Signed-off-by: Jimmy Zuber <jamz@amazon.com>
> ---
> Found by Sashiko while reviewing the FUSE_OPEN_ATOMIC series (see Link).
> To reproduce it without a DAX device, I removed ->direct_IO from
> fuse_file_aops and ran the open under UML with KASAN:
> 
>   BUG: KASAN: slab-use-after-free in fuse_file_release+0x31/0x123
>   ...
>   fuse_file_release+0x31/0x123
>   fuse_release_common+0x65/0x71
>   fuse_release+0x7f/0x8a
> 
> With this patch the open fails with -EINVAL and KASAN reports nothing.
> 
>  fs/fuse/dir.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index 28516a1760e24..4c64a4f812395 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -917,8 +917,11 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
>  		err = finish_open(file, entry, fuse_finish_open);
>  	}
>  	if (err) {
> -		fi = get_fuse_inode(inode);
> -		fuse_sync_release(fi, ff, flags);
> +		/* fput() releases a file that finish_open() opened */
> +		if (!(file->f_mode & FMODE_OPENED)) {
> +			fi = get_fuse_inode(inode);
> +			fuse_sync_release(fi, ff, flags);
> +		}
>  	} else {
>  		if (fm->fc->atomic_o_trunc && trunc)
>  			truncate_pagecache(inode, 0);
> 
> base-commit: 9b1da7b4a4e197072e630c3b85d4100a399752ff


This is super hard to see, I wonder if we should add a check in
fuse_finish_open()


  +       if ((file->f_flags & O_DIRECT) && !file->f_mapping->a_ops->direct_IO)
  +               return -EINVAL;
  +


and avoid the condition in fuse_create_open(). Or have both for safety.


Anyway, thanks for fixing it!


Reviewed-by: Bernd Schubert <bernd@bsbernd.com>
