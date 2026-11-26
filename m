Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706099;
	b=I0pcxf3tak8hGmWn91KDfRvDdYYBRud4096J1OPxkda4lljCfQhxu7S4y3r5qVuYGtlp
	 /mjWZExmNyJdGBiHgZ2dc3EQJY9rgVuKPSUizAwxrDF/pvzV1myGINIEWes/rTaExcCLC
	 kOI7hTosqHVCytvtPhXYt64L02FDkeucGFkkHFDp9fabeToGjV17xbX0GayIFL5w5W8Vh
	 3iwxLaQ4i7bbdnrGCd6FI+wjD6ELpwONQxxzQDQw2rPSFs/pOhkIJoovg1KNjIZr1E7n1
	 OLTP1ngiNObBv6suYE2RPBw6g+K7802gEkWQv9fOgbi28Z6yMBhpbw6dVnFIxOcqZFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706099;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=FoKv5A23gicur7souVyQ8/SUkHYwY2A/VyCPeFo4QKQ=;
	b=YF4+7t8O/tfpbncP/c6cICJH3aEw09Ym+TH0LluIhOofHVwkrdWOlsaWoQYPlvyqYV9w
	 U2QOZsjgZ+iLen/mULXuYmU9S2KDeU3Rjryv7o1jGZM2BK5CClKxnA/FG8SPuaK+ggwxq
	 gL/6qScMZ337huPAtn7h/GydVcIeKY2P5hI1t76+2E8R64ZwRZhkSBJOtyblNjZlTsMfv
	 wqAI6Vt3CwAbjBTCTqb5cum0ufHKpNYh4pYAkHErH4BIkz2owJGPMKWBuvS1XsO9xTEvn
	 JM/g3CkkigMDWXMLxxT9nVTPWCKYe74JGkyqSXIjcae5zkCsKS5o9VvAbiKfE7fp+4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bsbernd.com;
	spf=pass smtp.mailfrom=bsbernd.com;
	dkim=pass header.d=bsbernd.com header.i=@bsbernd.com header.a=rsa-sha256 header.s=fm2 header.b=PDAaC5nP;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=RzEA7020;
	arc=none smtp.remote-ip=103.168.172.159
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E36C606A31C
	for <fuse-devel@lists.linux.dev>; Thu, 26 Nov 2026 15:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E36C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bsbernd.com header.i=@bsbernd.com header.a=rsa-sha256 header.s=fm2 header.b=PDAaC5nP;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=RzEA7020
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B0C231400240
	for <fuse-devel@lists.linux.dev>; Thu, 26 Nov 2026 10:14:58 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 26 Nov 2026 10:14:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795706098;
	 x=1795792498; bh=FoKv5A23gicur7souVyQ8/SUkHYwY2A/VyCPeFo4QKQ=; b=
	PDAaC5nPSxDP/v6pZyacsLPlvD0lXWAs/xd2wcrtYqgTfz5mRHC9kJxkMT7mSGao
	pru2S091NUovJBBEeRwk8+GNldWdGCc8LE8bf3fQ9DNpfwc0peGM4/CJz1XujOYf
	WgQSV/3U9njio6uWjWrZIOXkrJlRkscI5V5NexWiTSWQZpsqA0YX9xNSCNMqJYHK
	a1n7/UcOO+Onjz//l4O6vYsNtEHegkoAPkh+um0Jr7i7YGtS47fcK16hc2Sl3m+Q
	qMzFovzRts8fap3uJKjRDkfRlAJpx3vWB0WCqVSZJoDF3y+Wqod6Qbk6bTarDyLi
	6FI2/LXTD1S3Sc6WQpRRXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1795706098; x=1795792498; bh=F
	oKv5A23gicur7souVyQ8/SUkHYwY2A/VyCPeFo4QKQ=; b=RzEA70200FKaOn+qe
	y9oj49bYLNKewdeHObzfUOB3gorDtFuDh9wEMjPYpS1MJChuCpLTuyQgPewmf/AO
	73Uj7TD4HIf/02RR/5KH8GI+38ub8i7oOcQ5azp6Fhyq77dc8sNdC0Ewm2fj0AY8
	l+HDFH90KwzQwS9z2z7QbZ7ZvszgxDVqXCqspYTjNukeaEo3FMnXbi9Y6xbMI1Mb
	nLxvZnr1RbU6Ef4+9K+OvtuepwDVn0Kgf6krxVh/7y+yJbIY6r43Gvcho0r6XnuU
	fJnKaW/BlawzId7cPCb0y4vTV5FR4rGbLPB+V9eQ7mkeFxnOicLLj35CDFDPYBg/
	7lOFw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=bsbernd.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795706098; d=bsbernd.com;
	mf=PGJlcm5kQGJzYmVybmQuY29tPg==;
	rt=PGZ1c2UtZGV2ZWxAbGlzdHMubGludXguZGV2Pg==;
	s=fm2:rsa-sha256:V+xGaVL1lzVHRzUE092P5VyLYFGH44vLvXB/hwh+/WtF1Qv
	Q5dev6bkm5IbxlkCT5tVuWldVziG3Q7pRUvL4JTDcF3rQU8iDdgV/itx1eXdYvBj
	WEA/Ng4ZQeDWXC7EyBW/ODf1s9oBqWdh36MbG0/e5QgQxOjU8/nP2/7tcOPhFNtx
	V9JrAomS2K9mOWUddc53eJQ+kvWuPRkenYYOW0powrLzkbwDBHMwONbgxvjz4BKN
	KyBlv4XYwpg3mSpovCqxiEqddTorXgoLtk6IQWowkYDAVwaLVEtW3aElY1IZPpDV
	hcZ1RZYBICLNPmlFlmbJneB9gk0yKhPK3jaPiAw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=content-language,content-transfer-encoding,content-type,date,
	feedback-id,from,in-reply-to,message-id,mime-version,references,
	subject,to,user-agent;
Message-Instance: m=1; h=sha256:yXswQM6z/saSmoOvp5BncYjPT00mjKSCKDrZcq6ojo8=:IgMugIyQ3GG2rLnVpVt6fYyW64SKHWAt0SqOztFTBrk=;
X-ME-Sender: <xms:8kwIa1XYnSIG1SH8vw8gHKTHyK6_aluVFEb8VyX5by0wo414BUyz4w>
    <xme:8kwIa7kZgYqCxRi35Cu2hZBYuRfpIJkupsjPidHbqjD9DDdnajM06Y8gYrjjlPqkq
    Oq-JWsP7uPoJGTBkYEVnCmpz62Vdg0Ha3npDeUMeQ-KVNXvwZhjEOQ>
X-ME-Received: <xmr:8kwIa_Af6U7asEtoZzLjODni_N_GppanbIBMNomB-80hVLwXf47CUrjDOSeNR6YIHm3EpEOm1V-7LGaemMRFlUGdRMbgUAYiKnYQ5J4pVN4MCYBRZg>
X-ME-Proxy-Cause: dmFkZTGV5r2s/twzWYOAH6wCLzaXtyKMdMNXhKtCCjo5722OuYwgT8O/xg2EnhkBLNnGIb
    uIGXbnsGDhi72kgwdLZ9D4QZAhTKmVvmU2YoNLMP3Ov3Ue1RcCWVBvMUM1yeNfg+TQKsrX
    MxhDDmhy0Ip/81YMvXiWtyT52DQ/6TCpjtLA0m1bwB2hqyJFZvaS6tXFqcAcPkOfjL/3Om
    i5X7JO2OZ6DH5BncRjOL4bCy45EQU2q7L9/hfSXSeUt38uS0V/FR+fnmOy6s/e6gWgkBki
    2WESMXx6c2V3zQFXiHROypLlSF5RH6XIxynshgE02c3bzyxKTY+1eCCL2TUgYVG7rmaKEn
    x4sBOeE1p7XMG3Kvy7CsFPvTxIDMvrBMed51IhcDIq7KmXOLXhophFO38kW8dYf8R+32o0
    j8SqWBuqKtBSCEoWmHn0zAkWPDOyczMn1Yks3m9sXFOjTAQ8funz3Yr/F2vlmd0q3BLiei
    +8jJsmqVJfb5GNemA6Uv08CkpgHXiVdeMASB6HDSeoTnPOzAOE7R+3Xs0ZUeinrqSCf+XC
    qE90JE0aqTogtigJfPZvOMUXq0gBr7HAHWSt9F8oC5mAl1wCvD2xRzeamRWW9HYaBIPBG8
    sHIZzrsef7Zkaz/kSQ30fsToK1Kk4J8EuKN7vqpViPcOfTjd2Ga1qXeKwuOw
X-ME-Proxy: <xmx:8kwIazeCDsXbN14qVtyAcptepAU4qxEhBDFsxNH11aBZg1gF5sOJ6Q>
    <xmx:8kwIayJZpZaesACj9fyAs4C5idm5dUQeYY-JL65wceNc0ac8wKoUcg>
    <xmx:8kwIa-dqa_dZWIw3ReBgram8MhTrQLBWbOWUu7RABiDQ8A_-X4JIPw>
    <xmx:8kwIax3BUJXNGuPQtN41EaQECST90Ecc3MTYFCHrt0kO4Ig4ByPphQ>
    <xmx:8kwIawu1dsUs45stC-Mdm8bc6ht2sQIBF6LlhMOJ7bolRNzqxKBGCXOk>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Nov 2026 10:14:58 -0500 (EST)
Message-ID: <ee6098a1-ec1d-4d1f-a989-9544edd5eb52@bsbernd.com>
Date: Thu, 26 Nov 2026 16:14:57 +0100
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
Subject: Re: [PATCH 2/6] fuse: allow O_DIRECT opens of dax inodes
To: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev
References: <20261126142512.219535-1-mszeredi@redhat.com>
 <20261126142512.219535-2-mszeredi@redhat.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20261126142512.219535-2-mszeredi@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/26/26 15:25, Miklos Szeredi wrote:
> Set ->direct_IO to noop_direct_IO, as other filesystems do whose
> ->read_iter/->write_iter handle IOCB_DIRECT themselves.  Beyond the
> gating this has no runtime effect: FOPEN_PASSTHROUGH is mandatory for a
> dax inode, so reads and writes are served by fuse_direct_*_iter() or
> fuse_passthrough_*_iter(), neither of which consults the address space
> operations, and the noop_direct_IO body cannot be reached.
> 
> Document why these operations look the way they do while at it.
> 
> Fixes: 2fbe4586cff3 ("fuse: add support for opening dax device as backing")
> Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> ---
>  fs/fuse/inode.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
> index af6d9e0af190..20fbc99f3590 100644
> --- a/fs/fuse/inode.c
> +++ b/fs/fuse/inode.c
> @@ -403,8 +403,20 @@ static void fuse_init_submount_lookup(struct fuse_submount_lookup *sl,
>  	refcount_set(&sl->count, 1);
>  }
>  
> +/*
> + * Address space operations for an inode backed by a passthrough extent map on
> + * a dax device.  Such an inode never uses the page cache: FOPEN_PASSTHROUGH is
> + * mandatory for a dax inode (see fuse_file_io_open()), so all I/O goes through
> + * the passthrough handlers and none of the generic page cache helpers can be
> + * reached.  That is why there's no ->read_folio here.
> + *
> + * ->direct_IO is never called for the same reason, but the pointer still needs
> + * to be non-NULL, because that's what do_dentry_open() and fcntl() look at to
> + * decide whether O_DIRECT is allowed on the file.
> + */
>  static const struct address_space_operations fuse_dax_aops = {
>  	.dirty_folio	= noop_dirty_folio,
> +	.direct_IO	= noop_direct_IO,
>  };
>  
>  static void fuse_init_inode(struct inode *inode, struct fuse_attr *attr,


Reviewed-by: Bernd Schubert <bernd@bsbernd.com>
