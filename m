Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793380753;
	b=vCYrm8aAkveja4SWCW8PCfmF6mjRsEOtINSPoxMv4DTf6Jo/EBEwjhmV0HwBuhNh67jK
	 yhBdeNpk2cBk7oecvnhgpDV+Ih1xmVygRnqVm9BXZlR+W/6qLh69XoM5ZDlWhki4YfN6p
	 PrYKJ6rCwA4HT/iVk99puC46ttt6svm1ATilCeCV29/lWDsz69y7GZsTpo1x7SlOi5SuM
	 jtO/7ywNW71gYkcUgM2bdXy+JluGj78lNFFrIG8rxWMsb6iYNoA8o5pc3pAIHMlutRJNw
	 UPQr1IY3qhZ7ymJcNO6LAVCeC7ZASKCqn5Kx5qtAo+qwA8p8+X3rNtCYremWdKHf3Mw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KmKG7M7f5HzFXvhjPiMlLhJhRLhSYMi7m6GZM6Rw3ds=;
	b=tHapAbXlxIOFRU0W154SdBznl9SlYWL4pGnwmI4MFFchNAlvb2Zd2oFBdODCuay6CaWu
	 u5RTMse0Qd8OpJu4FT+pF8KYGyYgCjGfLF1eXJMTC+oa0MdIR/lM8CDaqB86zp1fLPYpS
	 lqitCIz+djKNVf8qHudWHy6SJrTcGofcReNmp2p1FwKxDfw4RgT5FRpnnmTe+CSkFqpke
	 S3BqCfFgZZu9TxHUlBLAkQEPIqTeAl/PUGIhZxt/VGzsfeYLf9H3u7KAwYZwVkx/g7NKj
	 4oOcGmFeOm3IvJVB+FkULBe0nD5sXlEMz9P2CEA3fVtIIwLLFz1/Dnovnet9u/Hn6Wg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DbsoBKwn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FDC606A31F
	for <fuse-devel@lists.linux.dev>; Fri, 30 Oct 2026 17:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08FDC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DbsoBKwn
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4395d31228so142324466b.1
        for <fuse-devel@lists.linux.dev>; Fri, 30 Oct 2026 10:19:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793380751; cv=none;
        d=google.com; s=arc-20260327;
        b=FNf1LwJNMXyMyOqm5lftcfWEFSOuWYWF+T4efFsdZ1Y90FHsUokldusMVZmCXDYX0I
         B6jljVR3xu0g2hfYhGo6sBAI8zVJmK99n+tFDwYbHAaOWqPfAn6tTuzParqc98Ib+eB5
         ZnBDGrN0BCJmWOjt2V0I3gVu16oIHTRq7xGTN5eGCDcaJgJOjZvjTgHS6aKEidf2o9Bj
         qT+jVP+vV7wXikSFDMa4L5NVnoX5a7Kj0uDWXyKCrfgnMrvkUScIxlt5M69hiih0/zA5
         hPW7XwacbyW5i8ZjuFyyqtYFyzjzuLDKiDCyUSC+Tkd44AFxwaM3W0uRcmxv8yLhwiKo
         XXjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KmKG7M7f5HzFXvhjPiMlLhJhRLhSYMi7m6GZM6Rw3ds=;
        fh=nwBQUGq+ZF5mHX+lq2YwmfG2cOfAZ5qkBRABBFq0iFI=;
        b=hN6/myny/8dgwHBBMndHmQE+gtHyvEKyRFW6z9MTSTHvMf4DIZ4rMNhbHXD5s0AA45
         3jxFrGfVCfxEKXtO94DpN13594+BzjOh5s9AE9gF1i/GPihNe+lu2Jcar2xLKkIIUqte
         cfdCOFsu56rAXLvLFr1U24EklukkKOdMCaKa0/NoKsx4ImjDCToA3Ybh8YL+rU+BmUqz
         r7rAXB0oHEykumlAe2e76UiwQdYxcqjX6zl4GjlbZfIClCyNk3N4k3Fac+oVl2fS340E
         KfaGslP8jk3Ytwx3hhf2DJRWGh3pK2TI3b/OxrptXCcy9ZFEvKxJEtXZ72rwRnIaQM2v
         NiXw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793380751; x=1793985551; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KmKG7M7f5HzFXvhjPiMlLhJhRLhSYMi7m6GZM6Rw3ds=;
        b=DbsoBKwnYrMlY04WA2Owjxvt0yGJZgGblBJrak/ctQT2/lFjNfa9zdPsro8popMRSO
         YYLnE4i1jbOkgEeVFo39hRGpHCqjYdLsGUaGXkv/NAsnU0Rou+Ut877DqaLFDHC3l1hQ
         w7KQ4ss6RB4y2HUxSWSHhzXbJHhu3Li7Oo/PG80YEF835pzVUK49FDS86gBCn31gubGU
         DSgDszaqIozuSqJ53GPSI2pTgpz0/TEStDvjpKkolpyrU95kiEDrDrjDiinGmnMKzDci
         /RrbwGc/Is8//AJRPcbcb6uN0W3n7VV5FgyhxKPgx42cHx40/G80uUYoyyS1QfmwFv/5
         +4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380751; x=1793985551;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KmKG7M7f5HzFXvhjPiMlLhJhRLhSYMi7m6GZM6Rw3ds=;
        b=duHJX0DSOT4hwpCpvqDiX2n3BYMP9+MMUrEfo1d2JtIPPAwsA3RtybHKYB+vjF8CtT
         /Meu/9Rmi+03bAKaRVFUvdmHNoz1TT+DOsFdJnexE7QUgEJkRU4u8zUJ9lW+pO5kDfOx
         J9zYkAL97DLk2ug9p+IfI+VgUHY2CuyIY25XPqswHvvQRITphKfUdmAx7hb0dhQqFzwB
         ItyAXTQJf8474zZNwCef8Zn8CB60X0sSxk12lCrXXRHU4x6FJV1X0lku5QAU6Z6T2MPc
         XHYIzAzNKC3YpPZr5flFTLXjHT+TSdOI4W9459ew0JjxzdLiYTgYvRywGmSjTVeVaBwu
         TMcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkF9EfR7eVr2NlWz/ACZWYPWHcqwjD2W76vUF5ebxyFvCFocop4MftbGjDGhMJXq87sZ2kWXfOKS4W@lists.linux.dev
X-Gm-Message-State: AFq9FYLPa9OWWFg/6eP/5ZuLizRA+M4OWjunechQi3jkGsfec0uGfwRy
	BECOoq35Yt9ure8hGgQ0SsBJujvhFuZizFhb5/ysRG05yzYgJRazNhZEvIoL2erG72DusyhawU7
	pQ4op0Tw+KYk+cLSawGThpwNw1yXILEfQpmkl
X-Gm-Gg: AYBFou1WBbBhVm/Rc114P9Y/EijHHhM9GLhQzfzL9H1B+jNStHv1yCJpcI3xsyxS4PY
	1NPOahEH3B0+ZwRlDkLIgk6nQq9Utw70EbiHgr777p38xpPnMU75mxEB7wMZQikU9P/Ud6t8nil
	9STa/x9xEHEl+lcdNUN+MblZhrtcSksqTIH9oB8Dc7gHdXPkX0CIisEpQfMNLdO4C+WsVDtjVy+
	dwUx7n56xVfJGjnzElTUCPde7ycdo0DbU7ypzzNCmsNXBZYDhZt+hC0yY5mlnOLyfTZ6dV9b0Sn
	rC30PTyB2vsjVxg+68QQvHlpwLxyLD8itSOkGFOzV3WeQsFlPVkETODRVdQHjng78GolM531ZfL
	PwKUbglCmrSipmmU7yV4y28QbLjjB4THRdtY1HblOQJio5+V5Kj7yPB4DaZZfG0YE4zOilg==
X-Received: by 2002:a17:907:7253:b0:c46:7de7:e432 with SMTP id
 a640c23a62f3a-c4ca7ab116dmr280137166b.42.1793380750799; Fri, 30 Oct 2026
 10:19:10 -0700 (PDT)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261028091215.914885-1-hanwenn@gmail.com> <20261028091215.914885-4-hanwenn@gmail.com>
 <CAOQ4uxifRX0mnMXXCwVEy57_ecqjEHF6w7pE9sqvMr341ixCxg@mail.gmail.com> <CAOw_e7b5T=9hyEYLQAY=2ybkZx1UA85_FGzfK7R03GYhZgYbyg@mail.gmail.com>
In-Reply-To: <CAOw_e7b5T=9hyEYLQAY=2ybkZx1UA85_FGzfK7R03GYhZgYbyg@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 30 Oct 2026 18:18:59 +0100
X-Gm-Features: AclHuK-Y2zRDbyhy-OKNOKdZR-vKwZ0nBlHMqPHm7RIKUW67MFFIe7aP7bvKvns
Message-ID: <CAOQ4uxg4pFVmjoLDwghVj_S=9VbPKBBwBrZZQXhx+WDM7ifo7w@mail.gmail.com>
Subject: Re: [PATCH 3/7] fuse: fill the negative lookup cache from complete
 READDIRPLUS passes
To: Han-Wen Nienhuys <hanwenn@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 5:39=E2=80=AFPM Han-Wen Nienhuys <hanwenn@gmail.com=
> wrote:
>
> thanks for your review!
>
> On Fri, Oct 30, 2026 at 4:04=E2=80=AFPM Amir Goldstein <amir73il@gmail.co=
m> wrote:
> > > Names are collected per struct fuse_file, as hashes in a temporary
> > > array, since their number is only known at EOF. The collection is
> >
> > Since the server is communicating TTL in "." entry, how about letting i=
t
> > communicate the expected collection size in st_size or st_blocks of dir=
ectory?
> >
> > This is generally what directory size means and many filesystems
> > can have this number ready to publish without a full readdir.
> > Not sure if the contract of FOPEN_COMPLETE_DIR should include this or n=
ot.
>
> We could add this, but I think we'd have to do something sensible if
> the size isn't set, so it doesn't save complexity. The memory savings
> are transient (while the dir is open) and not that large (54 bits per
> entry). Also, what happens if the server sets the size incorrectly
> (ie. too small)? Do we just accept filling a bloom filter that is
> useless? How would the server know they made a mistake?
>
> altogether, I think we'd better size the filter automatically.

Yes we need to support a dynamically sized directory, but if the server kno=
ws
the number of entries in advance and could communicate them reliably
to the kernel that could save all the intermediate building of the list
and could be a lot more efficient, especially with very large directories.

But it's an optimization so no need to do it now.

Thanks,
Amir.
