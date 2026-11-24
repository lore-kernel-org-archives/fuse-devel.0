Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795518852;
	b=OHP5btM6Pn/OvSp/719idZ6im9I4onlHCIPGlcmiBxVhwjyaI1uwmpDGQL2gJjLR8+T4
	 VNTAtgW+cDBL6IHlY9qLuI21skEzV+1WhL9/3syoxzJja/lU6hSXYsaeVRARrt6Ifhpbk
	 iDT+rELBTVq44f5bSshC140dh2GpP12aiZ37lbikLx5ErSpPxDQjrosiV3GVDHFhzZ0wu
	 8moAThDYs8uk2wvrtpIbsjxpSvEL6PE8s803LE19wQlejNPynfEcAj1XEOXlcQEn9SMP6
	 ITzw47jljmSpWVWkbAlvxxYA5w0mr/ssZCh6gqRK5pPWM5usg8Pc0u4n/bPatv5Qosw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=YxcSWKYnItj3yo5FCFqsfm26g9ItY5gHtNPYg7zw1LA=;
	b=z8EkKA/U31zQvCEooJXqk/AozzjGJkpOyLYaBqcUTpZencV1FjDPf+c36GxJFh2EGzHg
	 VHiaiBFpaLBUV9EHJUCpEukv3RsK05JP3lgv2zOkc/YqxVeC2w0gbTemYGhictOMvYOWc
	 Ksp7sIUXYt3/WPSMTEFh91+CySKqbsRr47QxRvwh98ve1HhsqZPApeVgJB9vcTr2bV+fu
	 s9aEaaxGs3iY5AvJIrWWvPmDIgP+22usCCobIgGDMXs0qE3faM0/rM7di9OAAZGi/YpG0
	 5NXIqtn+AD+GGFrTBXYJ58/ftItye2VZoWGn2oIS8EnCV9AVqgBNw1w7jiIN7gjqJMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szeredi.hu;
	spf=pass smtp.mailfrom=szeredi.hu;
	dkim=pass header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=GMzzcfBv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3046A606A326
	for <fuse-devel@lists.linux.dev>; Tue, 24 Nov 2026 11:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3046A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=GMzzcfBv
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-9496577d4c4so508072785a.1
        for <fuse-devel@lists.linux.dev>; Tue, 24 Nov 2026 03:14:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795518851; cv=none;
        d=google.com; s=arc-20260327;
        b=i2Z49+88im+USYqlsQs3+7HKI8iy9ddR5fWiQlWruWKKILPMi+xK+Wja7Wi6/0Nnxn
         KAj9lIrTq40Uu01s7xY4kTLddZAbpuXPOt7LClBER/1MKxBQpwhPqdddbn+5QKkB5qBx
         rXuMYaFfttKDhyCMT0MQDL1OsXrytr1cdDB0br8LDgWlo0Mm0Sg5886EwPfk94MBBDBK
         Cdkzl3onWYVie6FF58D+IV1UgM5bWAgopd7i4GxiGX9JXe8opxqd+qjhjwoqkBEjW12h
         XC/9njsXGD6rqUuLjIh1RfHUyk+UAILcER4yE1mpYy7ni7SwvsjU2PQnASP2DkABNSU6
         vfHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YxcSWKYnItj3yo5FCFqsfm26g9ItY5gHtNPYg7zw1LA=;
        fh=RH4xQ4cNK5W5uQI1FXsSC4uJLSAa/e9mc1XYzNa8fKo=;
        b=k26h3+IbU+ED/6GESXg3tnZwg6aKkweDEPVqpEqeT5WxeDFptVTSgcJIOoHYxkK9HO
         q/zRVzJV2TBQPPKrPB5howtu0s5Rcn06ZDxipepDx8fU+83/vJNI9kpiBk0/i4l+uw1Z
         nOvjQtNb1CeaRSP8lCtqv0Kr2bleULhmbhzIjsuUXwIru1cqUaLkwmBZM5yeR9JLFJty
         sWL0lviwCNoUBWctD4p2I9Joxy4G1DFQ7R+0dPNPi9E9c4ztp0RH5IBxoqksCaWQVU9u
         bfbSmTMBjWmCmPv3ZM5n6nYJXL7+mxOtFK3PVaf1zcmouDQk7Zfq0H36p1tnxoypl8Lx
         iQTA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1795518851; x=1796123651; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YxcSWKYnItj3yo5FCFqsfm26g9ItY5gHtNPYg7zw1LA=;
        b=GMzzcfBvw+aONBCpWkjfANJ6eTt7SCTdxcTNrqAbFsQlXUww+E75+oNRQxShLUNA/3
         LihFRUw40zgScK/aVX9Ex3KN8pBKx+Htdt0R6r6WhHeHSAEgvOsZP79+JNtSiVABjTL2
         tgwMkgP+cx/csM/Y5yW24w498WmHXnLlB7J5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795518851; x=1796123651;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YxcSWKYnItj3yo5FCFqsfm26g9ItY5gHtNPYg7zw1LA=;
        b=qbVmlDaAzBtfaGI+otRCvSMfKXsmu3qyqCvVaakQ45g+RwJzSF+uLW+fHvxoviNg/t
         GnCNa0F/jOWJRKOH9ONcQNwEBwj/atuqKucV3H/5HqjmJe4n+aE5+uvlTLRdZNtDNcbq
         aneosr/XjwWyk3pXzgu6Nsk6CYRfhmcwHnFfktTDA39QWwOpx3IAONS2n47qgcaNRsKe
         qQgQR+3wVR/EaDT5rkk9EPyHzu8CgftYVQv6Ei6F5N1WPj1kUgT9KHMHtpqKQty4qAdo
         CHzSTlbTxTU8GjeBRNeC/ps5uNYtaQTLgRtnF0NYZj2EKprgnMtdY94i+twSxoXfd4Nj
         2ReQ==
X-Forwarded-Encrypted: i=1; AL+hErEjp70/2dhJ/+8eDY2HfCJ7f8LPqbDFG3R4SFvIWwQM8VAU4/psZktO1ut3N4XO2esU2G6lggoyuog/@lists.linux.dev
X-Gm-Message-State: APuU4Z/FVGsDIDtMV/FNkHsQsLygveIdbkeFxf9ZZKHRR0YBacWi5aRU
	xYf81YjfK5BuC9IU7GREKRjTT49X8nYJirdkgS6OW2pfZFFCG/GvybAOQKFjE0XQovn3Z7XoIzm
	+XvuQFbujT56oHRYvqNPSfQVhtI/cAV5P46zhyuRDbw==
X-Gm-Gg: AZFdTZeFmU6ejj5qPrlgGWFrsrqxBO1xvt1ppsxhZb7MhE+h8eQO0W58lSAuwcGKdxB
	V95VbJtm0HstcQ/w3pMtLgoqgNKgsCgyDIYyuvPy3PWfRVibS8u4rHIBefH8+vOytptBJyYncXT
	llMVXLkFtBya7Z4kokOjtzSX+MLQKDHMhigg/79+xoNFKPO8s4mUY4rkL20Ll2KXD1/0kaeW30f
	H/XNyGt7Y7ejsNWJN5y6X2AoYHIA+E6cff6/DvTXv0H+yHDkXXG27at4JZVZC1cRLs3OY/mNoJX
	ll47hL0kD3WL8roXeOLN0mKTI7IYrfhVvqMZYG0i62wnUyw6aNpmPhbMAGYaO2PrrTr+tNcQLKL
	cDhUcjxW66TCvKPyChqx5CudwA6Bk2G1wglpbiUTabSKVd1XBfjRdznqGnbTV/dO8IA==
X-Received: by 2002:a05:620a:199a:b0:949:aceb:b77f with SMTP id
 af79cd13be357-949b36034edmr2558799785a.30.1795518851115; Tue, 24 Nov 2026
 03:14:11 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261123095455.88622-1-liwang@kylinos.cn>
In-Reply-To: <20261123095455.88622-1-liwang@kylinos.cn>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 24 Nov 2026 12:13:59 +0100
X-Gm-Features: Aa3M54pbj8-6gfE1d-Xj-d2hBGWMonaIctmbDSe8aODDQN2gLU60G5Esc5wLwmc
Message-ID: <CAJfpeguSMMaBuELCVtUpEvCZZCRZK-xvs_TMMD8r_KuuzzQoaQ@mail.gmail.com>
Subject: Re: [PATCH] virtiofs: fix potential unmount or device removal hang
 due to stuck FORGETs
To: Li Wang <liwang@kylinos.cn>
Cc: German Maglione <gmaglione@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	"Michael S . Tsirkin" <mst@redhat.com>, fuse-devel@lists.linux.dev, virtualization@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, virtio-fs@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 10:55, Li Wang <liwang@kylinos.cn> wrote:

> After the FORGET is dropped, return 0 so this same worker invocation
> continues with the rest of queued_reqs.  A full queue still returns 1.

Applied, thanks.

Miklos
