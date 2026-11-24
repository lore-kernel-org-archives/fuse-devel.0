Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795521397;
	b=rbf3JL03pI2NvZ1XgxiHy/6Am6GXkzDzebCnXzEuAs9C7x2KLuqXCqGHjPZDdxSuSrk2
	 anwYkR44i2IwYju75dL30IjxlVt29I2Trdcw5Oh0MlW4cl785kJSJIjDCUYG3fjwIQnCJ
	 fkrN6IVndVktjxx/2pOMUBckyzomvkrY59soQy6HyrOXk1mEuEjPpM5CXNrt78x8YPNos
	 By7eLAGHyNC2HPl19LgbDbfxdpUU/+JCcqe4x1kvHSUr4ZvRX805DfeCAbHHDqg7ZXGOK
	 63iZgh/JK1w8bwA7N44JFSkRFHOOKiHNCwftxKlZfyRafhQ8+B3JhgBoxMsDh+8hbjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=fN0Pn0El80XUQKehRoTuEs2GevsM86o7JzOJp/aukV8=;
	b=ofCfo33t64znljD6OkpZKGoAwkOK9GpRhzBKcuq/9OKfoF/9mE/2aWqtMmtM+ZGkqWJ4
	 BAJ9OmsJXxEKjmj7ThbaEbg3lmDSeZ/kbZcovpMtbVv+8nUA8Mi0rDpliEbgvtHKguArI
	 OFjTrtDDU/OTicVjdB+cEqZf+XJUHOHlsC0H+ifgrSBCeMxxKnzD14oacGWVLbtwMuJl/
	 1emCqQe6feu5LydfwPprN6yjZkRxRPt2rtBkN6Exh7B/3nz1v0jkRdbo+2A/HDBDpfTlf
	 e70ik2c3LOHRbPDYYQaSKWmxcnDO8PZ/9XQ0TtXwSJq4EKCQCf+94vvNvKJ/7pONqMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szeredi.hu;
	spf=pass smtp.mailfrom=szeredi.hu;
	dkim=pass header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b="aLLGWWW/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6039606A31E
	for <fuse-devel@lists.linux.dev>; Tue, 24 Nov 2026 11:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6039606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=aLLGWWW/
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5365f9a04c5so24288221cf.1
        for <fuse-devel@lists.linux.dev>; Tue, 24 Nov 2026 03:56:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795521396; cv=none;
        d=google.com; s=arc-20260327;
        b=sowYA7jycTlVi9goE3Uc4iqrQ35l4yPEmduLMRbHNnHFgSKOniMAnY5gM/H6DRdrtp
         fRfQWSZLXXsWp9vJJSamk17ODOXOpcI3NH6s+LAfpMaRgyzdcPeq4iyMJayOX60fOoD8
         6hWU4LdD7zf30/LHeloBPOLfqcZS64pBt4HxfaHCrBjNNpoWz8GYAsUrjmh8e481fPSQ
         xZ56oK6bBfSoiEj4zmb1dMueBIOoOoRgm8twuGehg7M7FUJ6G548QDFaESG0tc0DzqJW
         iaVAEE3Ln9Ly4YMYaFQSmiGobfTjglBSxfkUD+/vEqtLwpVypOnKVpLIR4qJIjV9XUdZ
         WA3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fN0Pn0El80XUQKehRoTuEs2GevsM86o7JzOJp/aukV8=;
        fh=SUY6bq/NMQ5+aWPNk6OWI3SFn+jYv4ZU3kFm1jMmZmM=;
        b=YqvzY2bqNxX8xGUVeIkVpJYj4NwSO+yDFTYpE5sy5LDtFq8Q4PT2R1M688T2goEKi8
         ohb+OJk6Mhpf5s4AR790L7lzJCUxIDdbfhyq9wnBKB+9h30jnsY5RC/w+IL+FWPpPvXP
         /hMJ5NLr5vQLgcvevD6QYTdqU4AOiprtYA7DiWaXBAIDKtZ+wyW94I2uHjiGtv1U13+R
         /UArPae1mSXCKu8ACSJuS/c9DigF4uMQqjfvbZkFtcNlg5k7glretI1SJagQbMXbm3pT
         itYpT/ZXlFel0CltIbUxjevcJ8dQZ9acb/5B3agnW0ADlfWWxsFyGIRY8Sm3p4cY1eT9
         tGxg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1795521396; x=1796126196; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fN0Pn0El80XUQKehRoTuEs2GevsM86o7JzOJp/aukV8=;
        b=aLLGWWW/aBeXs8GRnNA2UszXZUXh2Sx0dFlcEMLGWQs4q1lTkN34A9ROHsdrfQYQpx
         kMYc62zj8OArz+0oOWDAt/9vrRER0xSQBzMGYU/D/twQ/Rh34ESH56W8d0sFHcvmFNI2
         Hztp6j4XE3bC95XtuQ8XwuYmy3PIFXsfTXkNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521396; x=1796126196;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fN0Pn0El80XUQKehRoTuEs2GevsM86o7JzOJp/aukV8=;
        b=d8JtHy5y1Eg3z8koVqojEHw6PYDlTfkh5uJWvjCUvTvF7UqPuI788osL4oz6PZvCgM
         BQENp2USNOFQQkWT9wPuVdZ0lgD3BBLPp8eMmWkaa/P1MIXfW7yjv43SxRwmR2ByEA6M
         dPohU46NyqVcawtd7VqLA+ascEHz5MgkS5/zZFrdfXvnIcOe3aCgNHkVA7z+tC9Rz7RZ
         xZVbx9YnQfG9L2kllw1Z2TwJQWYBBv4CY/U9Un1c6RLQpRKmm7KC42FatTIIMqy2OhLo
         zZEUiMKYFAvlptyU3S1KLTr6yqS36t4eGlPXJGrnunNHjUUB/90ZLcMovDHW03sGnkHI
         w5UA==
X-Forwarded-Encrypted: i=1; AL+hErF4P/dD/PByv3izFLQlcl9tdqv5lEN7gMCEANrj5y2CZKy5yb18Pb1geziOo6CnZlz4e2pOU8tH6mcm@lists.linux.dev
X-Gm-Message-State: APuU4Z9akJiLECmFwaP5bZzOQiaTB8xwKbfydTa2/wnvdXsDxlRev/LT
	XiyFQedmOIkpMIUec/20vqEgbxVAvMfEAmPmSRJTQUoDeUDhbsWULYRzp3ft3+FVnOqmnrLeMsR
	09gt7L2G6ZMIleG/9Fv4emNyVJvvb7ucCRMY9P7X9Jg==
X-Gm-Gg: AZFdTZejC+WV79PbskMYKzgdQ9nm8Y/6NN8syLHgjrEhrb5A70LMSbgv/myrpCegeuJ
	IZfNmDdljfvUDRZyeORYDjlWDvaniCxGdSDpOF70ENXTjVYy3XhpSPaIM5TMw9bsTR1jCUbAmE1
	wKsRU6WXt2DIgTlSHM1RkOeRBQbJ66TKkCUmyBFFhoWseNBvYLYZnhKSOwMzi2WCfK74X28kBNE
	ONULEX3zHUfC8XMQS1Cis/MiMta3xwkIJcWvygfa62QcO0ivtu9m2HoMJ8zxGwzzyfeLGt5dKMV
	Gz60zcqlJfJVwBjVIa3ii1zRDND2HgkdDRjMV83xjzSnCEhO8jIssT1DvHTEN2cMoc9SDfqiJ5j
	GjWqgeRc95nJp00uncCb+i2U/BFF37f/0rQqdCEoA9ktlBSbhvUG9rmhgV5scLu2NDQD+GA==
X-Received: by 2002:ac8:5c95:0:b0:55c:8dc9:401c with SMTP id
 d75a77b69052e-55d76ade97dmr278383741cf.70.1795521395688; Tue, 24 Nov 2026
 03:56:35 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119140240.1798841-1-mszeredi@redhat.com> <20261119140240.1798841-2-mszeredi@redhat.com>
 <dfb1cf09-3856-4437-b536-b792783bae37@kylinos.cn>
In-Reply-To: <dfb1cf09-3856-4437-b536-b792783bae37@kylinos.cn>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 24 Nov 2026 12:56:24 +0100
X-Gm-Features: Aa3M54oB6GLzmTd0LorEYjATr2uNrKvczYzJU2v3D4eG-dpkT7mCPKEj8fY7YHU
Message-ID: <CAJfpegsDyw0_M06YdzgYnYRTXS2zkMwD7f-aSnXp9Zn=LDpbag@mail.gmail.com>
Subject: Re: [PATCH 2/2] fuse: advertise support for DAX mappings
To: Li Wang <liwang@kylinos.cn>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Nov 2026 at 11:53, Li Wang <liwang@kylinos.cn> wrote:

> if (fuse_conn_vdax(fc))
>         fuse_vdax_dontcache(inode, attr->flags);
> else if (IS_ENABLED(CONFIG_FS_DAX) && !fc->is_virtiofs &&
>         S_ISREG(inode->i_mode) &&
>         ((bool)IS_DAX(inode) != (bool)(attr->flags & FUSE_ATTR_DAX)))
>                 d_mark_dontcache(inode);

Intentionally not handling this for the non-virtio_fs case, the only
current user of which is famfs, which is DAX only.  When a user comes
along that wants DAX mode to be changeable than we'll add support.

Thanks,
Miklos
