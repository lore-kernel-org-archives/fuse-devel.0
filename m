Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168EE3EB110
	for <fuse-devel@lists.linux.dev>; Wed, 10 Jun 2026 10:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781088690; cv=pass; b=uho1NL9gloud0zNR4mJ1PM9f9R/etEPuf6ORI2PUKRSJ3zS8OXD38QQ4o88luB/uik9YxBMWZ8aewO22XHH81NTYgCjhnvb5lMkKvU2cczn3fvnp/Cf/EGAc1f2s2vXKO3PlIe59rb1tiI+F+zcW2fA0zCX9ovimSTX2wKcS3Z4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781088690; c=relaxed/simple;
	bh=NRA+UzVMX2Fc9PnFDHJJXfkGDkgGU74N92tSmrp8lVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mG9HZPR5x5SfauTJqVbkpIKeVUpnSfm9gg3/oXFU6wj6hy148x3tDH+pqqRkw6pfvKLFagO9ZZlZ0PETLDNMLlH14o7WW0SvywydYzPqAc/oEgoSa39MUAUa5CyaodpMCmc5Veq1GE/cFwRM88xkTcQgjAgXz9j35sKHW4gN/O4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=hxznkO2M; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="hxznkO2M"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5176ca6bab1so69441121cf.0
        for <fuse-devel@lists.linux.dev>; Wed, 10 Jun 2026 03:51:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781088685; cv=none;
        d=google.com; s=arc-20240605;
        b=BQj63KJ6H0yeK0VR8fGt8NeneTxpCX5Ayv1zkSKgnYoUsE2NMTLWzEjOB0HnRSC8SI
         6mNCm1cz2vUR0pCRkaHJr5vkzWPahsXsVsd/d634R8CntgOr+jn6QSV+X9e2tAxBxPc1
         nD5PVk6m2081xDy+Fus/e0UtTgwBD7856CVhhkv9A8A5JtnGz5xPD4UtWzYiBNRJrOII
         a0M42aalvR8wJ/9rBT9hE5XMo1N+FQOOOozHvjHU4SecSkZFjd4qcqGYwvzsU3IRRRdy
         jYp/s/wINOFRbBJlg78gfdmC7zFxzNOzmml436wx/ccovoAnCQyfxJ4w3m14SIP3m7y0
         Fl2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Y/v66jPmn2tm4UHgX+kS3wkOmIpffRk86ipgq5jofZ4=;
        fh=a3hVNGa8pbPdMTl0IV9EL5CyYEQsxfXkZDKhl970TLY=;
        b=f57Ci4MJWtnZ9YeGzghl3X11bDb+kJTuJ6OeuTR8s75eAACzWUHwDD70Kr212A6NnO
         pdiDUhUR3PuwdJ+18mtVQFGdW7yRaNAqCyrr96jUK9NyEfcKBBbetwDcARQkivMWapak
         Z30CulNO5/BofcCTl5+vH0dO+u3ubgmyVvGD3Si7rItrdlvkqYUAKOqaIKI0mJys718n
         2NZpJMQnQ8b0TbE3f69Xfbq6iVeNrBjpZALZEJ9sxiJf/SBocTBQ4ZIfq5mI+qXb0wmY
         U42JKRDvfMMVVqImseYds/x7zfWdeBsCrBCXrthkOe9f/IctQXp4nSjxnSWooieGH5nY
         D3yg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781088685; x=1781693485; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/v66jPmn2tm4UHgX+kS3wkOmIpffRk86ipgq5jofZ4=;
        b=hxznkO2Mi5XRhs41dDIMVTHzchpJDvsomwDoU5MoHJXv+N7KOYH2A3BMAMK341E8iH
         fS+ViLfDGutB/dKqyJr6/N3+8FndnWiJR4Wi3aRF2Hbnke7Hp288GLZ4gBZovyowQ3KS
         0PK73m/r50EtJyE5yFVUPb0VIdfzz3N3GvFkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781088685; x=1781693485;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/v66jPmn2tm4UHgX+kS3wkOmIpffRk86ipgq5jofZ4=;
        b=LIrNcCSG5uQIBzoEd6nxy4ZN2rgXD4CpyzthZSusf5waDUMWBBlyHt8zoqBbXNHx+D
         LDKv0CEvSKzESu2u4p91pPZfI0H9WMx+z1YGeptqktGVQsoXKLEYhvJgQlOWz2IhjR8x
         M3nWj+wqNOLagQTSZLmUjQg29TnwrwXyt3K3VGYhB4XrVyuLuficSn8JrK9Gs9prwREw
         aS/wtvVtyT2873ZMfGzFKaz3YWgRe+K9HLgEe8kEtURxePq4WNPydlTtTIBzlqxXTKHh
         KAqCkV+M6aLE/57H9BRPyIaKNpo9GgSxfM00IkbMhYwAEl8VPry+4DaxlZqh1rurgh5k
         ffHA==
X-Forwarded-Encrypted: i=1; AFNElJ/4uis6txM7ad/nDmFbvPv8VDE2u2UOof+CYtZ/Qrq5J2/6p53T31OQaTdEt3rQiaekRQ6OeEOa4guF@lists.linux.dev
X-Gm-Message-State: AOJu0YwsPW2s5gGjZJkuEcqVaQkIdyE7iBRlkREU55vwpPxeHHkqeOKw
	FWzssE9nw0c0by9lNvOipVHWnanWpJMCRSXKq4jwyFhgiOSVFn0Mi6qxOmfP0wVnT6orPpFTzbf
	a5QG4L1f9NTnDfZqvpHUlC1pJIyeSlGlG+xshmifEVQ==
X-Gm-Gg: Acq92OFxJHmWi938rkkTzf1Ga2e5Sb6AvQw1n+0zx+KMxC5+68u2p5h6sGcqiqmtV/l
	JOps/gRe8/pyTlGujaewKkwiKVJvpfjipqcOpHdx1ZnszNNTUcD/cfQFQJAfAwVlOZZIkEa6kRx
	cfXpNfdwvzY4YWsWbAZMqNIETiZwXy7C7ce1h6T5lk2E1sBgNX2Yb1DNgBCf2G5No4OganDklJL
	CbTDJZOJZg8ijnNKpRKl5qoq/ASWi8FeS3tqeV+6ZaF9Rcj9714p+N+9PYti+7rKxrBaO48vP1T
	eqyHu7WA8p0glUmUqHxFQG3OWNkyxTjntVOx205T+Gig4pELkX6taZqd7Q/UkA==
X-Received: by 2002:a05:622a:17c7:b0:50f:f030:920d with SMTP id
 d75a77b69052e-5179881c7d5mr247838761cf.30.1781088684701; Wed, 10 Jun 2026
 03:51:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260529-reduced-nr-ring-queues_3-v5-0-1dc08c2fccf6@bsbernd.com>
In-Reply-To: <20260529-reduced-nr-ring-queues_3-v5-0-1dc08c2fccf6@bsbernd.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 10 Jun 2026 12:51:13 +0200
X-Gm-Features: AVVi8CcmHL8xf1YyAYGQ3CBCdsYGthO-GI2CzwmRgtAJyXCptClJRDRggDreEVI
Message-ID: <CAJfpegty63HGGNR7Vm0mpfs+PW0-r-hJDSASsRMk3JwsHTyrvw@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] fuse: {io-uring} Allow to reduce the number of
 queues and request distribution
To: bernd@bsbernd.com
Cc: Joanne Koong <joannelkoong@gmail.com>, Luis Henriques <luis@igalia.com>, 
	Gang He <dchg2000@gmail.com>, fuse-devel@lists.linux.dev, 
	Bernd Schubert <bschubert@ddn.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 29 May 2026 at 00:55, Bernd Schubert via B4 Relay
<devnull+bernd.bsbernd.com@kernel.org> wrote:
>
> This adds bitmaps that track which queues are registered and which queues
> do not have queued requests.
> These bitmaps are then used to map from request core to queue
> and also allow load distribution. NUMA affinity is handled and
> fuse client/server protocol does not need changes, all is handled
> in fuse client internally.
>
> Signed-off-by: Bernd Schubert <bschubert@ddn.com>

Joanne, your RvB is on the first few patches but not the rest.

I'd be more happy with a fully reviewed patchset, since this falls
outside my current expertise.

Related question: do we want to request automatic reviews by sashiko
on fuse-devel?  I do see dangers in relying too much on AI reviews
since it makes us lazy and complacent, otoh sashiko does seem to
provide useful feedback.

What do you all think?

Thanks,
Miklos
