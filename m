Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793307673;
	b=4x36AFrc3Cu+lkvEar6XSbqgYbC5n7Djqn3TVUIWuEjiV1hR983AOfz76nEKc+SJaQgC
	 V1O7GYxrTZAuN90xHgMT9NThtz5pyUAPAG8CzGmixyvLuW1rza/hUOw+I/wYSq9x7rPFr
	 SjgdjWeSb6WGUK04IsEKXn/wVgl/wvZ2h9I1hsjrMOKzL55B5HCIchB/wcg/NAYc3rROj
	 /tO3x+zEEs69744uGaelt78GJqf6rbNqRVX/yY4KlWwF1AyRH6tdwtZ+cz+YG+CIb1vcm
	 LhltPtoeru/EJfJntDGyLA71Jzi7d9QuZ/n6si+jq94NUeu9l9Kp7XS7SdTSw0b8+Cw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793307673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YIK53upmmFvVYNRWxlGPK1P4X8u03LuN3kGhKEomkRg=;
	b=pMnoNgp0f/FTzNCBsSInkyjmO1KIIji1F9+OXn5LdXfSoXolhDuyv1/jvGzy/y8f60hi
	 zAFCgdfSzmEwspdTwc/95jgfthRnOZQluSeLYNdEVoO3KB5lnaVCQGgpqYg74Kgs7xpE0
	 muShPZYwssB9MABIVTAyDo5e0aKBmLrkXqXSPKwnhwHehDfJtBkeU8Ye5tfsjTJy281Y+
	 la6UXxYhDhHNID7mbDDJ0N2yCm+z5TAhKpENqmNYD1R9czkitpFKJyIWEvnJ5ld27k57u
	 IYXkC6wHRhmpf+41e60OzrAFuasLSFfoGv4EbyalmDarQ6mfKQTW72FsrMtW4bPN/Ag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n5Tc+xdZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1897F606A31A
	for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 21:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1897F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n5Tc+xdZ
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so6757105e9.0
        for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 14:01:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793307671; cv=none;
        d=google.com; s=arc-20260327;
        b=AEf67la6jOZrbwMBAMuF4utCXhqUi2UTgKGIYKKgNW6/GyyrgRZoLS9hSgjwWRLNyv
         XsKVJZ4gPcVDjjEZzZPDd1D4ptfpBzMUcA2gDTTGgf+VsaRMprIJlPsJ49JOlrGYB0v5
         IwcCgxssYvXxl2LXW7qKQF7oJyDXuONv+jGsRNr8QYJZ3ajd8G0PruS+HGyJth+PflaQ
         RmygtUUDpQNA1tzkon82+lIrTkAhWwy9QnsrXcAQar9Ladps0cZ9YdBzyS3obpXuGi4A
         7DdHoJ6jyjoaaJO4Y4fAClcKIfunUbj72IJYt1ywAxOTfgV1RRLdi8De3v2f/zlZvlBh
         f/SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YIK53upmmFvVYNRWxlGPK1P4X8u03LuN3kGhKEomkRg=;
        fh=cUKa9ppQ2Dols7GP2qdSbUUkk/c96MgKlYy1pmHSlMA=;
        b=UPBmsHl4HJBw9CpcNqPILaIN4Getx98IV3M/Du3zJX+B9pL72rvwPGRVjwLfYDX1nw
         uc6t3E+/PE3Gjkxf/eOfYYyENcLZ2OoDHwYSYiN2ob0BUnEEzWJdjxa1Xv6wiCNSznh1
         Vw9L4rQ+lIkTACHZKp9G5zsVfaLJPjN2LNrYydFSgt4kollBE3wpSK2Bys9M52WWDDY/
         hQ+aejNeQtwEBXD7GbUaj0GInFnL2dBKQ9lRq/Dgbpm1Edx4GMA/8RD0PNY5RWPBKEon
         3M49ef8AC2APATGm+/t4hvUH9vnEd74UN6KNOU8Fy40MtnUnEQ0p7v9GwcPfDJhOzQ1T
         WLBg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793307671; x=1793912471; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YIK53upmmFvVYNRWxlGPK1P4X8u03LuN3kGhKEomkRg=;
        b=n5Tc+xdZz5r3NmRIzttCF4ATR8j2nVEKGCF+CExY8HFar6PYa/7SHhh2qtIkN8IfqJ
         nyXpWFxhdePSznn63L6vFWnMVAhf1SFESOKD1O4L//+qe07TGeIJPKNELl3ajY2NbIF6
         Ld8n950NCmu307uTTWI48LUYi37yDOhdjKGxXLmWc5yhCUIm0bWKcn8emKO7Yis035nH
         vuS38Od4YHjCOoDsyOfWPQ12JQ5Er2ykbddpKcD3kMvmKC/LfMvDP+itFgNb4c8DTNzQ
         BL8ODggbLZe3fr8oJs3bdzarutfQEHegUYYi/xjBHwv4JPmBb2d4+Y/yTNvxQ785eJwZ
         VaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793307671; x=1793912471;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YIK53upmmFvVYNRWxlGPK1P4X8u03LuN3kGhKEomkRg=;
        b=mkpRyWreZS6SDMO1s9Ag8MB7qcYhBwwbH6t5B0cDWewl4FQc4t98uCyOTeBu4y66sN
         PBt44/jiyoKxoXjQEqnrvaD/f0Bhy8D3V50JfG+VxaGepg4rRd1OqQt0QkK2N7SxGkVX
         aqEASciqVcsUblIWO51Yea4Xpzllvw6vgD2shJjhXiY6WnWkrtf2DYQe1BXG6J52hun0
         9h2m5uvo/s5R2RBRa/rY5LbU8gsh4T9qaK/dvvN0Vl1s6zbeH1i8DaJZLtHg+tMWT2aT
         SMOlt2qP03GleNSv2DDMH2I8ecjZQBT4ZExz7amM94/9xoEHSC1Dhp+CC6lUvkqI12RN
         tNgg==
X-Forwarded-Encrypted: i=1; AKwUvBwW13foUfIzo/KsG9dsCv/8zLWEYGQfex3MQbCNxkis4/nyU2kMHnQAUdm4Q9CK4OuAXhib7omdI7w/@lists.linux.dev
X-Gm-Message-State: AFq9FYIkSlu6BYC+wBSnqZrhhWDruvsuVLY0ZUbcjzCbsPf6xd6TT8mb
	bI66djpf76O1WjgtMnmYYeHe5qf/HxpHLE8mNia9vVfF791MwRqL6l272raOS9R+UvoVNlfLjD6
	fgW75T0mmLMFHMEvnSvJIhCCHAm8iYiyCgBsm
X-Gm-Gg: AYBFou3s46lZtoU5EPaJ32ubcDyUo9jCrUNnbM4d76+BGmIiwFWsR3J6hN9SDZkyGzf
	6mckPyRMwjUsriX85v/uivopYGLUH9fbCpQsrjQAdNgBJkg34QhI+sHFyS9F7j23gCTnhLEaB6+
	wzYVKG0XIciFDDe/+KmGBvDz0yoFQVsLNy0JcEwWJZ3ahf0NCQYoMBDqD93c4Qr4cmk9500FlZt
	Ak/rXcjBxNdxXb4tZzzXYVijMYb5Uavsv0ROHBoHK2eFhm6jIxzA12pQWNpV3CEpJoApBD5Ezsi
	yUJoWPi5eTuic/hEgr4FgiqpZACTpy/5tHp+He+zENkPWEHRw6zSKIH0fijPbPkhAJx0OjCwiNx
	hJ+QLjIjVQjNAxolh/FmqUwnQKTnnTpSMPttlssaH9QPYpy0wkMUfbehA2Mc4uAOyUMAebqtjXK
	an+2gekxwDd8C6KOX9EQ==
X-Received: by 2002:a05:600c:4715:b0:49f:ffa2:1c72 with SMTP id
 5b1f17b1804b1-4ac17567cc8mr3468175e9.11.1793307671248; Thu, 29 Oct 2026
 14:01:11 -0700 (PDT)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261025-reduced-nr-ring-queues_3-v8-0-8a2570e8d2a4@bsbernd.com> <20261025-reduced-nr-ring-queues_3-v8-6-8a2570e8d2a4@bsbernd.com>
In-Reply-To: <20261025-reduced-nr-ring-queues_3-v8-6-8a2570e8d2a4@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 29 Oct 2026 14:00:59 -0700
X-Gm-Features: AclHuK9uNE1Xvi8oLmWXJVEQtVIDdNeSdjMzN-iNOdCsYdI034XoI8pwXvzd76I
Message-ID: <CAJnrk1a8b_uVqE-2y79AMW8r0ETkgiFufvFFjuXfWFitxbe2MA@mail.gmail.com>
Subject: Re: [PATCH v8 6/8] fuse: {io-uring} Queue background requests on a
 different core
To: bernd@bsbernd.com
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 3:29=E2=80=AFPM Bernd Schubert via B4 Relay
<devnull+bernd.bsbernd.com@kernel.org> wrote:
>
> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> index cff8a06e6d68..f22a1b5fc7fb 100644
> --- a/fs/fuse/dev_uring.c
> +++ b/fs/fuse/dev_uring.c
>
> -static struct fuse_ring_queue *fuse_uring_select_queue(struct fuse_ring =
*ring)
> +static struct fuse_ring_queue *fuse_uring_select_queue(struct fuse_ring =
*ring,
> +                                                      bool background)
>  {
>         struct fuse_queue_maps *maps;
>         struct fuse_queue_map *q_map;
> @@ -1977,6 +1978,8 @@ static struct fuse_ring_queue *fuse_uring_select_qu=
eue(struct fuse_ring *ring)
>         if (!q_map->nr_queues)
>                 q_map =3D &maps->global;
>         qid =3D q_map->cpu_to_qid[cpu];
> +       if (qid =3D=3D cpu && background)
> +               qid =3D cpumask_next_wrap(qid, q_map->registered_q_mask);

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>

This looks fine to me. i think there are some systems (qemu?) where
SMT siblings have adjacent CPU ids so this would pick a sibling, but
we could always optimize this in the future if needed.

Thanks,
Joanne
