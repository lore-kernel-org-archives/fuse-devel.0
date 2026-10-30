Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793400547;
	b=oThwf5W3NjHKq4aaPy61ySaPM40SCpWOv9PIyhpcsxQpuRYOZX1D05Qa/VPqydwY8kfc
	 osjGlMWtxTsyWI42EBlpWWFcVhHb1AYl82LTT4ais7tjZIoK/yrsgU71YakqhsKD4Nyp0
	 MBK8H2ijFKdiyCD0K5+u/w9jpVnvU5TWxNh1NaAafHE/iPKJLFMhpPONx0snRIM/3keH9
	 0d6IwOa09pQsM4LUxYufrBgBNNC9F6HkK4PIHvEWSQwwMUapzwTR2/rSUXNjHnWwST7TA
	 W4lLJ18c+R91R/8TRhpmM8d4DZLPR/I3RJpc67IKM3Il6lkIOTl7YRfncls0wpsCz3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793400547;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Content-Type:Content-Transfer-Encoding:MIME-Version:From:To:
	 Cc:Subject:In-reply-to:References:Date:Message-id:Reply-To;
	bh=fT+OQrSBFiPM7CM2+FPmKMpeUOAFK5ZNFYv+xxEStMQ=;
	b=cTXCmgoA7A3w0kWoCAoaPInqL3AUVhWcGGlVdIpmfOFtB6Km8B6IYRA/Wtuzvz9kBAo/
	 8G/N0LVFYDwZC/qhiaybQJjHYj5Yo9I3IfnZdmh9n1DPwnkRN/io8sy/YXfEJj6Chdx2u
	 PjhXIiqA2n/915trxqa89R2N3HsMCmiz/4d6XI7jypv3Y/FgMtbdgpM8blOS3o4MJdTNd
	 TtIq15Ocs8tMcz/bPfBVvFlj1ubUWUe86XFqH6t16Ozm7GjozZENzXH3kmVk/iMhxxSZK
	 MvCNCeMLbTc/0AtXN2TcnXz8bPFBaEZXesRX1tg0Hy91KRccXFXhGe4qiwQ7+T4FQKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ownmail.net;
	spf=pass smtp.mailfrom=ownmail.net;
	dkim=pass header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b=PS9N+iyH;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b="fpd/+Nyg";
	arc=none smtp.remote-ip=202.12.124.152
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC11606A31C
	for <fuse-devel@lists.linux.dev>; Fri, 30 Oct 2026 22:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CC11606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b=PS9N+iyH;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=fpd/+Nyg
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C55157A0164
	for <fuse-devel@lists.linux.dev>; Fri, 30 Oct 2026 18:49:06 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 30 Oct 2026 18:49:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to; s=fm2; t=
	1793400546; x=1793486946; bh=fT+OQrSBFiPM7CM2+FPmKMpeUOAFK5ZNFYv
	+xxEStMQ=; b=PS9N+iyHnT4SMV+a/5c60a0KDAN+qLUOhwPxsPf8FvyRlReqeoM
	ZKzC2gz10eGm6Xb+LCe7Uaf+VTnB5ez1QO4Ju1X8TC5WnUBoFBAQuKxrFPg1mwe+
	19QiR+P2mq+MENxmsyM+n6auS8jyh07lASywIS4UrNIBUXI98D/CuGtz9Qwm4+EI
	5oegIepvdq5bVQ35iC5BwDihY6D6mVtidHzw7vCHEGpT6eS+ffOuzORsYvvAlRYk
	+hTj8LK6XXQhcpcPVrD1Dord/1vX7Nq08cK4pwiwXjKzlF4HJYyceh84Y7bd4RF2
	vO+LbalL09KOClfxZh48T9NqHa1NU/EAAcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793400546; x=
	1793486946; bh=fT+OQrSBFiPM7CM2+FPmKMpeUOAFK5ZNFYv+xxEStMQ=; b=f
	pd/+Nygh3CC5o6XjAnJqNd7/+xlGjWygAWneG+6aeJhzHWQuZI7JACPn8LtKmZcP
	b+rcRyP1XqQX7oeiJStxONo8vrHRd8sKvBw1u88TuDv2voTzddTN0VXKirciUsRS
	/KEu16Fmjokp8aIXdsq0rAMGMeT+w/F1FFgR0PVVryOETCCz0IXfTFPBnntApis1
	D6tcLnaSK4goaimJtLlcne8HMdqEUUiyubFF3XDjs7usEhDFM2l4dNIKC0yFrSlH
	vXiYVO1MkhF1eEcp9NVzyJhm2nZvTHuX3KONiOOTq197oFFHsgFIMSk5Q4PNsBwc
	Ur4enULKWw+8jDBG90Okg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=ownmail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793400546; d=ownmail.net;
	mf=PG5laWxiQG93bm1haWwubmV0Pg==;
	rt=PGZ1c2UtZGV2ZWxAbGlzdHMubGludXguZGV2Pg==;
	s=fm2:rsa-sha256:Fvrt6JJ+d0XTFlBQKs0ng0bzbwxk9zqw/2YLbAVkZpAuyBI
	Xao2bY1IAcXHn8W0RbmjiB1KzNrXC0CkXGkvMH5xqZRHMWGQ5fPXrU6aHCejD6xX
	e5m6I/xXFicZ+c0n6YJ/DhKJYkQ6Air2Ai3VUklRXe/WifUjEZFdLgC4s2gFj8gJ
	YbrLmQpDXojR5qpSvEQ3CwfDUQdkzDYEYWFU60j7fJ2BVdzNMUaqPkzTG68E9LHk
	aXqrXd3yOCNFuhbiLgskbWT5bKnKlyiecBWzvc+fYluPSGWOZA0LG0FCsjt8i3Rc
	Dy6tHZozawctI/ZYzEVDqq1aySLsg+mddqd93jg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,reply-to,
	subject,to;
Message-Instance: m=1; h=sha256:qXyJA32715ys7VP3B1xOVzqg3w5XTTlw5JUhnW6+wj4=:vDPxt7fnzMYx869eXAmOq9q1872D0rg0gCFSZrL8AIc=;
X-ME-Sender: <xms:4R7lat06Onejd_rg7tIjnRHPiiea8EouIsjq2brQvjJV6nTctbU8Qg>
    <xme:4R7lapBT9gsEnrMHz1jmbPZgn2fTtvOvJgprKX_GdMxy0sgNRFM05Xk_PB7JjhStv
    ogcyioeZt6BMgXDdQdnJRxSLl4JrSsHi3Q7MiKVE3qh64xGMAQ>
X-ME-Received: <xmr:4R7laiIkNdElKXokxRcGLlZIkuuSCdToGA8Ra0uCkNjGWQ5mMT-X9-UWrEpm8gXNx0osEqg--QzVPtdMxCS502UNDwDnvhA>
X-ME-Proxy-Cause: dmFkZTGx86ixzxqFr7DG5/S+744NrKiMWwWjcvwQgnQsFo0EefnYYiMCulkqJ66UugMNng
    wBjrtDzZ9TVctwx69E6l9V6DCeOYO5IVpg0/LuX8q4d9e7MMEroZDzSAG+16bTxU4Cs4W/
    qJYGJymIE57pCF1demnq8FKiwEwzYTZ+otHY6fNFhvZoPPh7ihGsD9OJOnpZggc5jK2Smh
    Foc7k1wenTtcAkSuWiFJYkQL7w/61fGJVHGwTP4S7QDytK3Qpuf/Pjxl3s8wtxVOAoUJDh
    Y2btYl4iyNxh6Gt2M/IwEQIAaZRkBpKc77GWwe3V7M4vJL0v1zYwbOcqmmv20+Kv/ZiCYF
    8X2fMpcGjNemVu4DAdpXQQRkXJ41n9tWX9EgGONLKa3JJW6UhiF5DjydZGI/X5jzi5AmQQ
    XhaHdiQbLZ0K7KlPNbBzFzWBNf+SKwmyrptTuf9B9gCV2feh2+uujl0h1fqwtNsqLHlgx/
    t91zaNbcj959uefyoqOUfgz4SyuymeiQ11h1mvQ0wEckM9erqmptNBSUXBh9gJve2/Ak1V
    0Wu2sv9TqKogMUGDJqsfEoGwCmevfA4Mtta5TZeC9n7jbAXIiF7nSGAh4EFMP97yax09X4
    0I5J8HGSdK7lE4iFKjIZ/pYscqxIZzEZEkG9mq6XfElLOTl9w+7X9NnurVeQ
X-ME-Proxy: <xmx:4R7laqmkEK8LRQbivM0TwxF9Ak7rr0X6vAgr1jeIYoTyJlFnGTK6NQ>
    <xmx:4R7lajbu2KBRaJCwWD0Hk06wlXa5mdxw6VzIsMVuB6AMKdBiKdPtaA>
    <xmx:4R7lau_X9Ue_K63IwrYA9xCTmqlpgDKAkbuAYrGFkM7q6Gss8sx1DA>
    <xmx:4R7laqbjp0lKHVX3CJRzgCmeSz9zeCEBQznXBQuxEcqDLvg2nfg9LQ>
    <xmx:4h7lavoy-TdniUV-G_sUPk_FrW_0IPsFOCJ412qdhJqQ7r3dt-bnZJNv>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Oct 2026 18:49:02 -0400 (EDT)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Jimmy Zuber" <jamz@amazon.com>
Cc: "Miklos Szeredi" <miklos@szeredi.hu>, fuse-devel@lists.linux.dev,
 linux-kselftest@vger.kernel.org, "Shuah Khan" <shuah@kernel.org>,
 "Bernd Schubert" <bernd@bsbernd.com>, "Jim Harris" <jiharris@nvidia.com>,
 "Horst Birthelmer" <horst@birthelmer.de>, "Luis Henriques" <luis@igalia.com>
Subject: Re: [PATCH v6 1/2] fuse: add FUSE_OPEN_ATOMIC
In-reply-to: <20261030192401.2543699-1-jamz@amazon.com>
References: <179332437497.269288.7305999595462479305@noble.neil.brown.name>
  <20261030192401.2543699-1-jamz@amazon.com>
Date: Sat, 31 Oct 2026 09:49:00 +1100
Message-id: <179340054030.269288.17605002354655480101@noble.neil.brown.name>
Reply-To: NeilBrown <neil@brown.name>

On Sat, 31 Oct 2026, Jimmy Zuber wrote:
> On Fri, 30 Oct 2026, NeilBrown wrote:
> > > - any other file: the server returns the entry only, and the VFS opens
> > >   it;
> >
> > Why is this a requirement?  I understand that the server *may* choose to
> > not open the file, so that the open doesn't happen until after the
> > permission check.  But shouldn't be up to the server to decide.
> 
> This doesn't have to be a requirement, for regular files the server can
> open if it chooses to. I'll reword. Are you also asking why this is just
> regular files and not directories too? I could look into that if you'd
> like? For what it's worth, special files should never get opened by the
> server on this path, the kernel opens them itself.

No, I wasn't asking about directories.  Opening directories this way
might be interesting, but I don't think it is important.

> 
> > > The VFS checks the open after the reply, as for other ->atomic_open()
> > > filesystems, and the kernel releases the file if the check fails.
> > > FMODE_CREATED is set only when the server reports FOPEN_CREATED.
> >
> > The above para seems to suggest that the server might open a file that
> > wasn't created.
> 
> Yeah, atomic_open is a lookup+open on the FUSE server, and that open
> might be an open-create or just an open. Either way, the server might
> open a preexisting file. I'll try to make all of this clearer in the
> next rev, once I've gotten any feedback on directional changes here.

Thanks for clarifying.  My only problem with the patch was that I found
the description confusing - everything looks OK from a VFS perspective.

Thanks,
NeilBrown


> 
> Thanks,
> Jimmy
> 

