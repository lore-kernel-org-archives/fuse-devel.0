Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16D63FF1C7
	for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 15:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778859413; cv=pass; b=pYi0LO8W83q9yRRORTrhIJLc7040tRQp2V4Nwo60m7vGa/vd62oBazLdUPxms5l+TYyDvV2ZTdoBr5521CXZWjXsY4rJWX29LiozUG/Ppeu0JJ2XVNk5dlKrkJUkRxDWjsYpIVH9lCWNek8rw0XkfHbhm//BevUf1+BwddK4UaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778859413; c=relaxed/simple;
	bh=kykws77BULxtSmKjoBBbw30bnYsC8gmeKzi2jZkmruA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c7YVms9gJTyYuSqPSWG3Rt3iY4X2sAhaARCRiSdXEIaNWJ1R5TmEhsLKvQm8lE8XkNf/BkUB4NdwgstGvJYHhtIt2DAD839AeBUSgyV8tM39oyKNS5OGf/y+Jb4PX4uVbNiMPSgsvJBpIpGMCgB6VMsso7aKmWsJvOOQ07aEYrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yjh7Wlhx; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yjh7Wlhx"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so88753855e9.2
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 08:36:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778859406; cv=none;
        d=google.com; s=arc-20240605;
        b=Z1fP+TgolCNjjfhmpuRP/ON7UHxrYrt6t9lQESnlV0tPg0m2aGSqKjZXKkZUy3oXZa
         SvW9WAl7BHp2fbvj462ZdwTKkYZY1IyvXVdBIfxsAkgnAt+jzfI7YYYTz3tHJQRAb6YU
         ZCBH2jH9F9mbdrsAAf/4YMRNFBmPMptvodr7C90iFRjnHrwaQYwbMj+52jCw4bieZxhk
         4M3zwmZszSl+xFdvR1GzNbCF1qbBy/kwMYMIyCL0cfHt0O9JKHocco4UL51XXTw20C6y
         HRhmevYgbju0ofhvXSLFkQA2E6DoZvYAwE4hw3B+CTPoBzb/KqSxVRSV/ivn59SEDz5X
         j3Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jftbg9UKQhl6uBWBnvNH84aVd8/N8H9pwuhHklH3D1w=;
        fh=n7hz32Cy4mbIrifagXOT9iZx81ecGmJfbVj6dBoCXaE=;
        b=O4zlkWa0vkfdJK/qc6DcKQQcv8o6xdDei6OXN51/78yQHQLT3NnJoJGZvK1A+yEms2
         E0BH3s1gbMr5UPzC1UM8ap+7/dsXTEqxVk4eXcqi6bqWStmedB27TrMQZnjYgTnymp4T
         0dUyCqYEpTtfdUHvvWWXuEJfXz2ZhGd4J14DhGXTbyXUSJBwtG7XT8pvpAdI+MpORBaE
         QIQETSgFGcsVBNCvvtJtAKlMRfWLC9SE89XI52AUa4D7jWxEQyG7NhN7BIFqvf1eZ7n5
         GrJ1gCSYXKotKK2Xbs3g9yXFsYXpNsnx2tGD6eLNOlfzPnjmz0iaDQf0icWcMNkky5Uv
         YTJQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778859406; x=1779464206; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jftbg9UKQhl6uBWBnvNH84aVd8/N8H9pwuhHklH3D1w=;
        b=Yjh7WlhxzTstu5kIj+ajvU/zjSHNd3XSS0RsVOwRxM9kfvB1M6xDRDY1NKAgRhHzti
         rwM/ym9YnXYVEinsJ12e5vmS6Cm8hV49BZwe9r+pINFeYHrgbb/ksT/MdUMH8OtAPovV
         mAsQY4puziwrrgTpcAW6sQgAnzvbydTqhQpCCUMDgSIXYIV5wq1fKTLNftUpeUXmkgX1
         RvTlev7poCJbk0PftKHaWlLxZg4my9GeoKAUBtBvcH5hirD4hJ3V6/+HbECbco/R2mXy
         rL0a0P9Cb5TBEw9qcHnLKCkBYMuRh15YhXrv4y+bn6blrX+Jq3JtRUrP3e3ZxonCRBXz
         yttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778859406; x=1779464206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jftbg9UKQhl6uBWBnvNH84aVd8/N8H9pwuhHklH3D1w=;
        b=eQK6yhXWXlkfJ38y8vYtxjqOjx0mtaIT1+75Gul2L2ZgymrdsDxdeOhEa1z1EFF8Ct
         JC8CFcEkTdUscfXYPToCAPEIVkIPCZ1wPQvRh4KW5peMljEqRxBc8POGtNE0iYnv5KU8
         xKVoCCaW5FWP7PKMsvLNNzBrTReMG0sNdTuazjjHTahGP6O1J6H6/5OHw1nWq/DmKYrg
         ST6T+IIkmPgyyGXEROKlsQiCc2yWPhlVwl3kk2jlfs7JtjkLvUbBgfdyGtCzCuhvXYEu
         jvkYETiqRvoHSvK/2ubSCq1l/2lrsc1Gcg9QG+RtloeEQtFDbvIj+dbppFmGuc0U920+
         ZSDA==
X-Forwarded-Encrypted: i=1; AFNElJ/2NzBYxaremvT/r4uhSN59d9SiCL2eTqg7AiUA3DFgYMfoGl7qKfSJwmma+Np4Od71+VdvdXXwNo9G@lists.linux.dev
X-Gm-Message-State: AOJu0YwVDfrb0N0/pQoc27OT6JW7fwiKs0N2xH1k7BJH8kFguatkMlJd
	qJ05PFpbZh5GLZfCGRWRKdR1/HtgG3hTq8Ysp9VpIBk5rQXLpdEcn+jwnwJlMv/gxO+3p37YbAW
	vftqZHTtkQGxDTaykBTpDeZOnih+7LSc=
X-Gm-Gg: Acq92OGKX70WsBVQDh4JkGZoqzHfeNMbGEmVTrSpC5OHEBZbI8WGFSbnuKSa2hFyJHV
	sacz6rxgY4SCQpOJDuYa6N590TNRldmB950sSIuN+nttzOZvgnftLPTH6IGYqiHbFZ62UiX2BOP
	lh2IIzOComWFKfms/Y2pSL0BfLtawRxSYoqySAR2kk001swX3WFV1kSm6ibPvGHveqAQZsI/7Lw
	1gM4JLFTl2aSOZ4ONDlWoB/HdFXe9t8WjAb2JiJaEvz2nZiXujNQErlASVcQ4hnSoNZFpluM0B+
	vB4kYg==
X-Received: by 2002:a05:600c:3b21:b0:48a:f18:ece4 with SMTP id
 5b1f17b1804b1-48fe6514dd6mr60783315e9.24.1778859406455; Fri, 15 May 2026
 08:36:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331223927.763741-1-quark@lihdd.net> <20260515001412.1270472-1-quark@lihdd.net>
 <8733ztt5o8.fsf@igalia.com>
In-Reply-To: <8733ztt5o8.fsf@igalia.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 15 May 2026 08:36:34 -0700
X-Gm-Features: AVHnY4Kh2Ono_aaAuXxaM5dgM2Ye6AP7gVnX7i1R3yS2Fo2HCz2yvbZ8r6yvuuM
Message-ID: <CAJnrk1YKmF29r0qr6ouKHqYTbKC-OR256aa=T+zHsU7jeTtQPQ@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: invalidate readdir cache on epoch bump
To: Luis Henriques <luis@igalia.com>
Cc: Jun Wu <quark@lihdd.net>, fuse-devel@lists.linux.dev, miklos@szeredi.hu, 
	Jun Wu <quark@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 1:53=E2=80=AFAM Luis Henriques <luis@igalia.com> wr=
ote:
>
> On Thu, May 14 2026, Jun Wu wrote:
>
> > From: Jun Wu <quark@meta.com>
> >
> > FUSE_NOTIFY_INC_EPOCH invalidates dentries, but does not invalidate cac=
hed
> > readdir results. A process with cwd inside a FUSE mount can therefore
> > observe stale readdir(".") output after an epoch bump.
> >
> > Fix this by recording epoch in the readdir cache and checking it on reu=
se.
> >
> > Minimal reproducer:
> >
> > - mount a tiny FUSE fs with an empty root directory
> > - on opendir, enable fi->cache_readdir and fi->keep_cache
> > - chdir into the mount and call readdir(".") to populate readdir cache
> > - make the FUSE server report one file in the root directory
> > - send only FUSE_NOTIFY_INC_EPOCH
> > - call readdir(".") again; before this change it stays stale, after thi=
s
> >   change it sees the new file
> >
> > Fixes: 2396356a945b ("fuse: add more control over cache invalidation be=
haviour")
> > Signed-off-by: Jun Wu <quark@meta.com>

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>

(btw, I think your v2 email may have gotten corrupted when sending. I
wasn't able to find it in my inbox and had to manually import Luis's.
I'm not seeing it show up on lore [1] either)

Thanks,
Joanne

[1] https://lore.kernel.org/fuse-devel/CAJnrk1YOzwNRS+qA74rLMFmx=3DJgE3VVue=
u9o7-pghsa4bPzYBw@mail.gmail.com/T/#t
