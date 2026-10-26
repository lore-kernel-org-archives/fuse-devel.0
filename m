Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793049188;
	b=zt05JTYRIBGsxhtTMxBgx0C5SeSSfPZ2rZtiOxPbI6H4q1C1CBXipY8AaM6OZS1u4gD0
	 YaMXM98AlnQfje1K59BLwC0K3ndYC1i5OpghXi3Q44k4baHwIz9tZ7u2dk8pW7+GRY1c/
	 7aa+/m0rWP24u+omJi50tMSyeSrY+GHDKpEN4Av86Hid8Yikvy3lR3NrPBofkwICI3arz
	 4JoRlbN4HpTN3DPdDs3HRz2kupRhsKzjVNaG4DHBlLorvlKkhwXVNdYS/ekTz4c1v2cK+
	 FSr9ConXA3blM8JMxZ5hnDA1m7Rl6zN/1j2E4EtA02cIepqWx+Phzqh6Bi8ynRNYStg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793049188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DHJtavu+2/U+JQu/CcN5O8eQFURCRgZCZvW77WMkrNk=;
	b=QzKSc6MksKPsz72/yn7i5Im1yS00pEVAuKZv0gY4BhRfuuvCrwbfbqv6n2OghJdNBkn3
	 U8AZcyA304hmVUgW8Kjxta5rqN0NjwyzEmPT9dtpXGbnnRxPr7GRCfvqNVrViX3II/3hk
	 hFbxLLsw4py9ooup3LhXBHdkmK6yZYc8aG7foS/9mcOrY2ZY4Yqw1R9ynR9hzq9QMH56o
	 d61c163LQ2VVNOcMSZkm8o6ftKDLKVfSJG3pSv782cjKDJPOPNfBCowEj5IR5+NqMeCyr
	 lC+50p4GKSJ5xFsfltKg6y0oWZszVqs48CvXS4pXev/81Gkdrn45LAS8MGmtlmaSZDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WEZsPiQb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500AA606A31B
	for <fuse-devel@lists.linux.dev>; Mon, 26 Oct 2026 21:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 500AA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WEZsPiQb
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso2162000f8f.2
        for <fuse-devel@lists.linux.dev>; Mon, 26 Oct 2026 14:13:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793049187; cv=none;
        d=google.com; s=arc-20260327;
        b=o9NBhybeO2K14dUzEl8aAkFrvtjD9OwrVMxSw6sp/iwc+VGRQKEbGMYosWx9V5DCzt
         SRD9XimRI15RQ7S9HxxZxR5/XmfsYTNkFQWdnn+pqOq9jjXcfmlRyZlKITkfPEhy6cdl
         lOBCa5vHISnJeEpwrlG4rfUmLb3qGyVcgum4wiK5A3bH7Mz+qKj3PobAmBZ/SjwauoGw
         8aa2Y2pBLOOTaHFTPZwHba9j0UHRpEiX9Opzeo71YIWBiFCNNxMtPEuDWB7I4neNxhWc
         AEKSnIPq050yfJ8PilqXSki1fOLz0mCkV+U2tF/NYASCOsnJXpjqFjpHRkz/vLk6fLol
         Vyuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DHJtavu+2/U+JQu/CcN5O8eQFURCRgZCZvW77WMkrNk=;
        fh=tPI6V6ELVlaSbAue+D1MS+lme39lAGu4qkFToBrimXA=;
        b=PwrOvKB5+ZrXn8Pt6d06S1q9U2KOTIJQZtzbIywocfShVjYuoiQmODYATQ/gtJ/qHm
         etxmNwVoVOCPQ9b1PdLxnYHRLr8KzYkkhl/7/JSqAYl+h77JiAqR9YzveT3o6DsoyHFp
         DjBRs90UW6HN6Bz6YpBPcVVNxUpWhZ3+v+QhRRTzpJI6I4CqF7BvMVw115289owWlfq6
         2kOKe0CqN8NQM9FSesNuEyzOibMtwodZWxZAsQHmukuQyISEfktkHxEAMvf8j9D4ttQj
         Nf5/QCZgil+Nhppexlr9mHvYP+9TC3fHXTYTAhTCAPBlVuGZ3A8sr+B/HwBtNH6iJX3D
         zBag==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793049187; x=1793653987; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DHJtavu+2/U+JQu/CcN5O8eQFURCRgZCZvW77WMkrNk=;
        b=WEZsPiQbIIK5RalOa2C4oe1fAnb9It+wz8drOA03/LCi3gqFaQ7wmH3BznLocp2SrB
         boshNQEMdJs2Sd+5EGec61IeG9R7NFhuVIV7L2BLIEUsddzXk3/NCOIOZ2oDkG7lwDFB
         GkztltTHG0UwIUXXi6FNG9frPv06t5cXrRH7hjh7ea1yxWlNR0aRndFr1EqEDKPrQ36a
         9qsG3ZDfN9RznFjVw1XYIE1dgUW0MlEJtg8p+DSqY8HYXaGDliDeZJ9Ujv2zlgGHk9kR
         GX30B+iL9PVSTmUv5K9ChdCbDV37McdINtrkHOUSHkHXfg1uh8/mpExgFlbUK/UPVA5H
         ZNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793049187; x=1793653987;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DHJtavu+2/U+JQu/CcN5O8eQFURCRgZCZvW77WMkrNk=;
        b=VABM9mBp+ij5pEYsFGOVgZNoMKtQSsoAWKVjTHahnoAaFVyTUq3xXeZ+DQv/E2Az3u
         kZy0quM0SPFKWq6QxzyA5/a03jkyK8kEe9XSwatDPhbFi+y76NLQMW7ZFMuG1I9NZyD+
         T/0cXlwXKxf7feAKGLy7sliku0grk8DLwZUe1STebzFil6Nue6xBR1uq5SRwPSg7J14C
         MbjOkAzkSx0mzGkeHzAX4ob6KOJKl2Dtpzv7MS0wvy3Eb5vqQX1+d2kg1gYFIDFna6IW
         ss78/aL3jLnqzgzXEII6XA4o6t4MVC46ocvRwfjnmqf4X3/OIClrjYz1s7fabkayPBej
         B1GQ==
X-Forwarded-Encrypted: i=1; AKwUvByBrt746SNNG9nOZBo32NFE2miWcbAxCpD/GO4yIdySsTYQS1VRgbQudf6zPPzWVBysCJs5vESozkG9@lists.linux.dev
X-Gm-Message-State: AFq9FYJHQhJK2Fz4Mrpj5oNooTgE872yvROhRH9xm9PHzfe+sD0+QmYu
	B9rtFp32WW2ichTgaT+agBkqPBjebC3I3nnStpKSjvIF/U3LBtsvVMy3w2+WbIsRLj1rSEa3Pdk
	MnGegm7+DkcTbxO8+u5Ukw7wRyEOC4OFW2Mi7
X-Gm-Gg: AYBFou07TqWJ0YLFyoIOHi1DAjVRhhiKEcpj+Gcnmh0q0GgnEpl3es9Pl2ZIxhBua9+
	7WO8M4bHBnOAdz29PwW8wi7l3vmrL4cMAn097TltSa/2Bmrz/XdJNtaB+cNx5NeqVz6tm0Pq/Yp
	lnjT6b+y2uBWPBXds1RKOqQjb1tsOYX1mC1QpakSuw+X1MDj2+XoO8yQOQH5OaX0FouqNQ5qkrl
	12fulXsc3s/jYSod6AA3N9izkwnWyuVf53JU7wE2zhAxJOIHvCPRzmg1TvEZDI7v//WXQ2fxO5u
	m+HoOQOqrXh9HZPNc0NCATT1mLnRik25U00Od75zKqoChTCiiR0Cy8CgdEx4bTh9uCoYp/jB8Ht
	gMgFXviEbICp0qq1+HTAylw/SasR8luHB1u4ZVZWX7FCUeBOeRicpyARFJkUAKbx7KCzffDcU5y
	6SYDgNj+fcC/s0+BcgHg==
X-Received: by 2002:a05:6000:2012:b0:488:83f7:6352 with SMTP id
 ffacd0b85a97d-48e3eb24734mr15655232f8f.4.1793049186455; Mon, 26 Oct 2026
 14:13:06 -0700 (PDT)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261025-reduced-nr-ring-queues_3-v8-0-8a2570e8d2a4@bsbernd.com> <20261025-reduced-nr-ring-queues_3-v8-2-8a2570e8d2a4@bsbernd.com>
In-Reply-To: <20261025-reduced-nr-ring-queues_3-v8-2-8a2570e8d2a4@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 26 Oct 2026 14:12:53 -0700
X-Gm-Features: AclHuK-O80Z3Uh6zxtVzW4TmAH0enngdRzgM_cMY7We6aiCPAOIsn2325iW2Bjg
Message-ID: <CAJnrk1afQS06fFEDzV=Av_2AZG3Db+Wx-bvm2-H9EM3ASQfyUA@mail.gmail.com>
Subject: Re: [PATCH v8 2/8] fuse: {io-uring} Rename ring->nr_queues to max_nr_queues
To: bernd@bsbernd.com
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 3:29=E2=80=AFPM Bernd Schubert via B4 Relay
<devnull+bernd.bsbernd.com@kernel.org> wrote:
>
> diff --git a/fs/fuse/dev_uring_i.h b/fs/fuse/dev_uring_i.h
> index 77f87075f62d..10e3936814cc 100644
> --- a/fs/fuse/dev_uring_i.h
> +++ b/fs/fuse/dev_uring_i.h
> @@ -162,7 +162,7 @@ struct fuse_ring {
>         struct fuse_chan *chan;
>
>         /* number of ring queues */

nit: "maximum number of ring queues"

Otherwise, this patch still lgtm.

Thanks,
Joanne

> -       size_t nr_queues;
> +       size_t max_nr_queues;
