Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795009103;
	b=eamtonr03D6hNb0kzXFH+URM28AN15MB16xBO87FwqWgN5JMrpo7/jQsKu3Ih07YtE3U
	 EkPcxYG4eK7f67VnDe9SZdDZIAiMo3805+Wxloek1mwYvOekEI5PMnHnpmR9h38JUw0Vu
	 qVal/JJUEnXZ+rrMdIqL4j9FG9CBn9E5AbpHHRjtseqZPBtVVwZYhan2JpHLjaYbYEqA4
	 O5a6v63TJkZt2QexSOMMUeWyaO/M2X3ZYo0X4JuNxVMAc+03RlHVdTfVU8fdlaXIYw5QH
	 aoKWoFmd9IIRIwpfNbCCctGCBaN6/60S4nBciiZWi/SYrfOJxxB+hET9YRc2e4McE6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Gu0OV3kkEAl4D4CjhNeE+xCTUXelNvJBkZGChj72U4U=;
	b=koGUKTdGb93GUkpwoJb5+kl60M3Yo/4O24p1UWDPksnMWjfRj/c5Hi6ekQRnuiIfHCXM
	 GbrDkm+o+wGq0f3OMBcqqJhFAGYUFLybBmevciYcs6XxI8roTYjHbJT2jrB49CLgS4APe
	 mYunvpoySCjweS+AntNWS+DF4aTP2XckYQq+l5qPTznhtoo65z0bghNPMYRr9/w5B2J2i
	 MkVyns+BTKMISm2yMdEO4zqWXost/peMw07DcJXbm6OAk5VddNEIybEItWOAgT35QYCoI
	 HOBLN9wPBEMGWNQQCywg6trMt4lyBDq9IJbbEaVt07J3MpQ5WRuMx6UJEFQPk3Guczw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szeredi.hu;
	spf=pass smtp.mailfrom=szeredi.hu;
	dkim=pass header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=CpAqusmB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F45606A339
	for <fuse-devel@lists.linux.dev>; Wed, 18 Nov 2026 13:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50F45606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=CpAqusmB
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5361e313e63so10746571cf.3
        for <fuse-devel@lists.linux.dev>; Wed, 18 Nov 2026 05:38:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795009101; cv=none;
        d=google.com; s=arc-20260327;
        b=fZgQ8awdMHgBU5Xrdpz6as6Nx5T4ffNmVfzUVCiiAr2nLINIsD4bQDvLp4Zh0JizSP
         EH3tvEL+uqt31Ytx3DbJLHgwyFspwzi02cQgfEMZaxoYqngLSv+aJvBDHj1qamc55NoU
         doO0hEq3ub1mH3H2pvZc6F/o+uqljb+YdPNMKMABhBqRJSCvoDelPjmkPthABAJv4z/w
         gI3D6yh2iYX7VbIOQaqCSoD1hLo+CCx7SR7owrijYKolIAnSfChfmYAtJL0JMvtSLNfK
         29poHgfsRy5aptD4sIKQm+T+fE1t44ToKv+75R27iYskMI5PcfADKQEXSdGqfMAn/mEo
         ezjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Gu0OV3kkEAl4D4CjhNeE+xCTUXelNvJBkZGChj72U4U=;
        fh=VP4nE1kk9iEKIP6pi5209rSGdUOkzDD6P3nfvV4Wgog=;
        b=VgsoDQLU9Ew2UPQxOBW9Ce2J87g+B1YhbBJk+696G4I32we8k0f8/QQaOZKk7Q1Y1D
         l60cbnVackwG2UWnks9EJA+7XOzub2QKfekZqpvEQ9F6c0pjqiJxPSvLKUnTJRK7Mx9V
         AYwCvxz9THqHxJkDwu3w7Kie9/BbwqSI7ffqDfrq/GgvIj5eRNir8aakJFpOOoXNC1I2
         1GkjVIARgpLj50ldHeXTeuzCF2fR8R2W3Vby+TzvL7G6c5cjfyUKM0JtU+8MjFuL+0Yx
         a1cqniEpV7Kbv0ZftDM9ec09ST9Ik7goZgIbuqVU/+twkzO0QNW3jk3yI94Ak+zWPeHc
         p2tg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1795009101; x=1795613901; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gu0OV3kkEAl4D4CjhNeE+xCTUXelNvJBkZGChj72U4U=;
        b=CpAqusmBXxajthJtA1YMHzQSr6cHOmdpV406bN7OOCqcjPs8ssXd9Lm94rVja5bC1J
         kK8oGuKrUL7A5gThTsdxdIGZg2WWdaJ/I6KdqZmFlPdnSMyB0wewPWCREbs4QQNgil6o
         C1ns5sleK9cvcuXg+d0GHrscKC7Jw73bzNGXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009101; x=1795613901;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Gu0OV3kkEAl4D4CjhNeE+xCTUXelNvJBkZGChj72U4U=;
        b=GgJ0cXQ5OP2avYKVM/b6CQPysmntvhmDJgV13rYMVzJvly8FQl6aPS7Nz0cuTR0D+V
         6Ujke/+k2RyfHXmzla81QbA+BlqvzPgwqitlclBcD+S/OW5ya6pX3DG80Cd/Qgchr3Xh
         3Z16/fnQOcs6Bjesk2kU5FLaHrMXu1QIo/PGPqV31K2yyUpKr6ayIpU6jooE6U5BRO4O
         7fkGdmUo9R1MorFcLGvB3ZRmAd7qzan5ph67Kdawv+4lC5GAevTEAmol6tlL/6orZNIx
         AyhfBgChU/D6KHzK9g13udDxpPRuGCDbnauUV2iV0w0gtrj35+5SF4mRfdS+7DsN/FhZ
         SqIQ==
X-Forwarded-Encrypted: i=1; AL+hErGh2YandWSDokKcD04hrWHPDIEtyUwR9aVmip9Z2hXO+lD++x2Nc4SL3va5kbQ84cYaBk1shP3UGBBZ@lists.linux.dev
X-Gm-Message-State: APuU4Z/Xa7dZQiLaz8aQNG6EkDYYc3vD5kN+b9/I7SHuZ1qcMVFyflbM
	9HXnZ1k6nMxap5s7Ti9XuCZqv0wnhyyR6Xo610U0OvJeVRvrjna2CSloTlYHanMuwaDAdRK0Wco
	Ridn5BBZ80OsUnJmBW0aOz+JNsoUk0bxS7+WoRCVarA==
X-Gm-Gg: AYBFou3i1mdyFA/f+0hoW45jWi/f6evkFJrPTNO7lNLmVPXspnNvXj42fo9xmS3ieaM
	cRB3NvH2dSP9pHf4kX/3hzMX8Mdfn+nFTpuop2/+stU+7eZyMa9SSFgOKRSpkgmlMaUUU0sv5ij
	DJaqMaZZZsG7Hod8zjPOSKTi+wpxx7bAFsu/U/VwnGVf4A84I85bcfVuEXj+COFbv8nhdROzbcU
	S6f5vrw8Jzu52zmRbJoLNu+YNZ5eCrgt43woRo8D5svdlxEKbuJLAmJKDDUEZoViVjNAcx6S36W
	gVzrZMm79ahb6GSShvQvWaBeVdTK5Xvyyk+X5i2jLoEwOFpIz9crPdVyhsXkdH5WJLKY5zf4FkU
	bm63SOKgDyJkm6lLxiix4TaxO7I0SennRtJha/C5rh/YsuhLeBxh/mWILaMnh4M7aAwBCZYMC5I
	WnhRi0hOxgYNI=
X-Received: by 2002:a05:622a:558e:b0:55c:f47a:8c96 with SMTP id
 d75a77b69052e-55d5a340368mr39697851cf.3.1795009101249; Wed, 18 Nov 2026
 05:38:21 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261117135146.3174252-1-graypanda.inzag@gmail.com> <20261117135146.3174252-2-graypanda.inzag@gmail.com>
In-Reply-To: <20261117135146.3174252-2-graypanda.inzag@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 18 Nov 2026 14:38:09 +0100
X-Gm-Features: AclHuK95w6kthqK2rcV5FGmp6byHyDgOGBtGbNMoFRdYyxphnOM3Now-gzk5ZLo
Message-ID: <CAJfpegvfKhZYuMQ914GUPNvdPi-nZBYE9qfwHVg6m+8ABuhqCg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] fuse: skip dcache instantiation for readdirplus
 names with embedded NUL
To: Junyoung Jang <graypanda.inzag@gmail.com>
Cc: Jan Kara <jack@suse.cz>, Amir Goldstein <amir73il@gmail.com>, 
	Matt Bobrowski <matt@bobrowski.net>, Gwanhyun Lee <gwanhyunlee@gmail.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Nov 2026 at 14:52, Junyoung Jang <graypanda.inzag@gmail.com> wrote:

> Some FUSE servers include a terminating NUL in namelen.  Follow
> nfs_prime_dcache() in commit 78d04af4995a1 ("NFS: nfs_prime_dcache must
> validate the filename") by skipping dcache instantiation without
> failing getdents().  Return -EIO from fuse_direntplus_link() so
> parse_dirplusfile() sends FUSE_FORGET for the unused lookup reference
> and continues readdir.

Applied, thanks.

Miklos
