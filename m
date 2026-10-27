Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793081478;
	b=cPFqZWTypqGT0itmzcjrl5hc6AGnnCzHMLNnuGVLBxLOzwQDZiKHdlc2pgRyphHghRks
	 Myymcoj3dOs4J/7L9FC7lajnLePWKassNAMXJ70wRGgbI/4/HX/poqDddrEfV7HLBRZDp
	 dD5oi10cLMDRqkHRjVrMpirXtjmssAtikutLfC0O5vjCrmy3g8qKV6xknQbdlBuO9Z5uE
	 Dfy0jyDLiT7QfvDpnyU911Wqt8ACLigGXIVLavL+fYmfOnZxzXea/C3ebbsJVEYjxZJRF
	 ONhx+R+YUJCNC/3mCyiZ/wUZIlGGDWBpAjvhz/Nkb02KC2b1b4tNWvwHlGXXHnefUXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793081478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4Pjo86kDpvsltjEBt1wKIox6QkBbo8XHwlOL5T4d8l8=;
	b=di7xcUXEQVYrq9o3OjP4vZzN3Lr3dqbHEIxPOGoG5ZKDg4YnKWMT21WMq+pfFhSH+9hK
	 sAJYXhglrBQMjN9eCQYvchMWH75A7SSO8BcCehLdA23Bsf/iRNUVBDVPQJavQRs4g5CAZ
	 n8YjLDqsE4TyjEvN9kzOTeDwZGFauuXWnMHM5+5jdclJCe1qLF8/W9QqaofxhUYur1bGd
	 CbeotgTd7guz6lD1N0pDA6nZSc+gSkk3w55+lFf3uPBlkIfrhHLvvYB8Yma8bQ4sf9NaV
	 RjlN0sj4hPWM2zx9Z91jmpBZ7Q7RscUfRTOAnqNOoHKfPy5IzsshC4jL2siAAcFeAcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kFy2Gwws;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7A9606A31A
	for <fuse-devel@lists.linux.dev>; Tue, 27 Oct 2026 06:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B7A9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kFy2Gwws
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so19057645e9.0
        for <fuse-devel@lists.linux.dev>; Mon, 26 Oct 2026 23:11:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793081476; cv=none;
        d=google.com; s=arc-20260327;
        b=YREvHqjySZGr+07BxSOnrmWa0ApA33YQUhX3Qh8o+Mq/IIg1zJKp/gzZJe3OPCCY7T
         +9qaT1kwDh8H6Hvne10C8ExLrUpmplw/bRfuV124Z6zG39Jr7R7akR5biW6bm0FC4bKB
         gnIIY4RxbWFZw41SrUXM61ciBop6Zi51rQfChE2UqK3LGvqeE0wx3G3sHyy6kJ95zAJ/
         AJjW7FyL1sJiClpnZH5PdMLUDr2nOZI1Qm4mm0vHu1HaDGQ4gIqTSvORGnz5G+8BtRRO
         lwob2ewx4gjdtMbduZVgU1QCgwJSDnj3GjZD4vpJNl4vu8NMd+/BK6BahxHv/zIyWTcv
         MnXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Pjo86kDpvsltjEBt1wKIox6QkBbo8XHwlOL5T4d8l8=;
        fh=P283+iZYj0AUK6/XBzQWResmzs3VGj/L545tUnN1KSU=;
        b=YGKQtnofmV+3fsWBm6sTduJH/KUBv25z3m4QMIHrGEz+dQjtRSo+5tEf+lbLHZr3Ab
         ZGKtOTow+IsLFoKIozsIAjGw84sWoRDSzwgY/93vBvWLZKwAfcehPJ61JEcox1BoB+6Q
         bUkuSi5XE+1VFbtVecA2BQOJQH9OoQEYrff5rgv/3XpcyuLCTso6VgPXOzSA2nvnkQHO
         ABWSQJdh4UR5vY83mZkdhCKvFPzlKys72jPTYaGyAmc8wCZuyGd5DviIL6JfBZdkGC79
         yLIC0HViwauU0RfSMFbSYNBYyN0bLKbQh62MKJhxcR97QrbYBxR5Se+U6zI5vCzalkBL
         sGZg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793081476; x=1793686276; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Pjo86kDpvsltjEBt1wKIox6QkBbo8XHwlOL5T4d8l8=;
        b=kFy2GwwsRvtSHy0JLMfVoiIr19hp7ZzzXeZdIVLQPAgt1vg7qFfZMUAhuVgSMMfhMa
         IALpfuXKNcV2fdqqKWEKee4YZYpDi1HE6MpNcx4+HE/ussTKNFuvKpcaXWXo0ahChcyM
         jK7goPnCFvqf921n+bjlT/RZqPPYuuti0cDxjxK1rp//RNOxeZU4eASg/pgMfh/zI390
         zBTkS4+MVL2Mm+AipJ6XCnhKLU6N/FbkwqbUMuFj/rsKeXazOHZoUdBgsSXsqcuoq9Ek
         SI9IG/ZK0XnjkpvsyAumYjaXjV6jaMgDyBiXR5z70rgV0aMRuie8h0BRIyyrD3eW22A4
         qopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793081476; x=1793686276;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Pjo86kDpvsltjEBt1wKIox6QkBbo8XHwlOL5T4d8l8=;
        b=SDZxWRcOmYZoS8+W+K1KtVNR78E0YDsChKlaJIS/jaTS+SWVGz2P3Q0TKVvBIW3XoZ
         z2GzJi1XwiSWqUMpr6l3jN3ym8qWwlLDHkxchYAgAz3fdC7lB9vZHpODi/ELkqNUjXlG
         xhFlIpJlk8h7kwt+ej2U+9mWX9ajClU+EPNOJwbnpBK8wwLxqSdvJZa2ZWWZDqWKgk/T
         nrm/eBsl0sSuIWvUJFiaXnnZSV/gEh11+ZDT82wQoJ+HhnzaMas6yQLIGifTTH84kIyw
         6PSHTq9XdQI6N4IlCdOXv1/44vUaEtFVk6y0mFPQ+Ymi8HyAZgNgRRoECvYUpPOfEvXr
         hfdA==
X-Forwarded-Encrypted: i=1; AKwUvByjsd8VDnHJPfVC1iCBaTHNrDjgKhFlOHuj3vfFt8WNBYbV4/i5kXslzvxqvKMuPV5OxNBcMUT2WEAQ@lists.linux.dev
X-Gm-Message-State: AFq9FYJwnM5MM5ui2DlNn9LuOl/PxCAMZzE2y/sLepBCHoza45ThHw1W
	ZJGy2mAhcezfAWHWbmy1nntmn0fY1y4cexUBe6+OrA2WRF3NqaCKuw0dL4VYELNXLPcVTJwOEOs
	eoSLuQYd/LbxdmwgZ0pd/szvTEPpOTVI=
X-Gm-Gg: AYBFou0RuoN8IH08LuU8gWoKHGfBJposPmSOHlAqYXcnYmCMgog+zIy9ycrK5Z8z0fU
	L2nuws90MgFuHyBfBcj98KzTMF1AC5l65orHqQjciNSEEwf8DTTydSj6aIaP/kHIFOkIZNAbHaV
	NINdZk4FUupT+eNIe41vYNkJepLmDuKwj8Z88zbvq6jvMlvD65FuLcErou9Jv89EyApvaMu19Bk
	3zMdV+u/scGLmkajg532YI73rjFazwEAbZ+439yTZrNAe5X74cT7CICVXl/IYNcLf1PjojtrKs0
	fKMd1Wsd2/mdxp8TLmMzaCC/u0aNkmpmNxxHiAnv4z7/bnKzNzs4GEcl0x77rTfbAVQqA5hlUKi
	ebKPCp1R6gMzERfdisgwpB8eiPi9yZnVbY21ZpKPEaSROfGXlBuWlz0tlSKMLoDPUD2LpRb5JFV
	VrR9e1+0CUn3HrRmVmxg==
X-Received: by 2002:a05:600c:34c9:b0:4a2:994:575c with SMTP id
 5b1f17b1804b1-4a35acb994bmr164911605e9.34.1793081476279; Mon, 26 Oct 2026
 23:11:16 -0700 (PDT)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261025-reduced-nr-ring-queues_3-v8-0-8a2570e8d2a4@bsbernd.com> <20261025-reduced-nr-ring-queues_3-v8-5-8a2570e8d2a4@bsbernd.com>
In-Reply-To: <20261025-reduced-nr-ring-queues_3-v8-5-8a2570e8d2a4@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 26 Oct 2026 23:11:04 -0700
X-Gm-Features: AclHuK_iWTGrdVQio_gmzYpWB5fhWmN27CYKAtO3qwqmaSWNxaHVJqDZ_E1AIeM
Message-ID: <CAJnrk1b6=qnA4kFMigV1XYjA8rs5grAHvt6OFUK4OP_UrPv2uQ@mail.gmail.com>
Subject: Re: [PATCH v8 5/8] fuse: {io-uring} Allow reduced queues through INIT negotiation
To: bernd@bsbernd.com
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 3:29=E2=80=AFPM Bernd Schubert via B4 Relay
<devnull+bernd.bsbernd.com@kernel.org> wrote:
>
> @@ -1521,7 +1525,8 @@ static struct fuse_init_args *fuse_new_init(struct =
fuse_mount *fm)
>                 flags |=3D FUSE_HAS_SYNCFS;
>
>         if (fuse_uring_enabled())
> -               flags |=3D FUSE_OVER_IO_URING | FUSE_HAS_IO_URING_BUFPOOL=
;
> +               flags |=3D FUSE_OVER_IO_URING | FUSE_HAS_IO_URING_BUFPOOL=
 |
> +                        FUSE_URING_REDUCED_Q;
>
>         ia->in.flags =3D flags;
>         ia->in.flags2 =3D flags >> 32;
> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> index 616430a2973c..d8cb1764e2ca 100644
> --- a/include/uapi/linux/fuse.h
> +++ b/include/uapi/linux/fuse.h
> @@ -257,6 +257,7 @@
>   *  - add backing_id_64 to fuse_open_out
>   *  - add FUSE_NOTIFY_BACKING_MAP, fuse_notify_backing_map_out, fuse_ext=
ent
>   *  - add FUSE_BACKING_MAP_CREATE, FUSE_BACKING_MAP_CYCLIC
> + *  - add FUSE_URING_REDUCED_Q
>   */
>
>  #ifndef _LINUX_FUSE_H
> @@ -480,6 +481,8 @@ struct fuse_file_lock {
>   *             privilege that mounting virtiofs or fuseblk requires).
>   *             Insufficiently privileged servers ignore it.
>   * FUSE_PASSTHROUGH_V2: use 64 bit server allocated backing ID
> + * FUSE_URING_REDUCED_Q: INIT reply opt-in to 1..nr-cpus queues, each cr=
eated
> + *             with FUSE_IO_URING_CMD_ADD_QUEUE; serving starts at the f=
irst entry.
>   */
>  #define FUSE_ASYNC_READ                (1 << 0)
>  #define FUSE_POSIX_LOCKS       (1 << 1)
> @@ -530,6 +533,7 @@ struct fuse_file_lock {
>  #define FUSE_HAS_IO_URING_BUFPOOL (1ULL << 43)
>  #define FUSE_HAS_SYNCFS                (1ULL << 44)
>  #define FUSE_PASSTHROUGH_V2    (1ULL << 45)
> +#define FUSE_URING_REDUCED_Q   (1ULL << 46)

Hi Bernd,

I thought from the discussion on the previous patchset version that we
were eliminating FUSE_URING_REDUCED_Q altogether [1]? I still think
FUSE_URING_REDUCED_Q is too narrow of a flag and instead advertising
something like FUSE_URING_DYNAMIC_QUEUES would be a cleaner uapi. imo
that would broadcast the general feature of dynamically
adding/removing queues (the patches for dynamically removing queues
isn't out yet, but ideally would land in the same merge window as this
series) where reduced / configurable queues is a natural byproduct of
that more general feature.

What are your thoughts?

Thanks,
Joanne

[1] https://lore.kernel.org/fuse-devel/CAJnrk1Z7ECu5vLqnO7ubdkBLZqLB42njaBi=
nqg2LMWpqx=3Ds4Ew@mail.gmail.com/
