Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3B6173
	for <fuse-devel@lists.linux.dev>; Tue,  7 Jul 2026 01:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783386375; cv=pass; b=Qd1Edwy0rwAJzkW9/U5whX7CdJJ/g+ykadrKbVow0IAyOgneFhvDG/46EHLmgnzU8u3ceG5ax87Yxpv3as/nG7vVe2AL15TOPv9XTQoacXRKuFKH8P0ukdi0oDqFEKYWFoW8jQOgqQq48GuqUJkGZ+Kg1ByLc3jOrpJ4iadwg+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783386375; c=relaxed/simple;
	bh=1cVUMFMBeoUz0Y8dmZcg+CAn0nZ3hquYpnV4AN1MMHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pQznANfWhSd0xC/nQzDk3MuJO8fGgxvhh0NbEqdEregH4q4SxR4ZaxmNOUom+SZa/0JMBLNZcf+ji9inyfSRdVGNxGzNmFH/2OGJnwHvAo9owmWgUgNZsV90JCM4kYiZsrf5bZj3wzMnH3W8NFkpStSRgQXGisfpiIsR6pZlGZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtsURakA; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtsURakA"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c1276f8414bso441723066b.0
        for <fuse-devel@lists.linux.dev>; Mon, 06 Jul 2026 18:06:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783386373; cv=none;
        d=google.com; s=arc-20260327;
        b=eUFkDtO3fQo9FUC8se7/HeDB6r9shVPjxrFpydrxB5Qjx8EG5HP73Q/i/NVMNESMBt
         p13K/Axv+1oops46XSTp7jc+zqC4SDrf1+VXI64GL62hYdO5N/6MsGR4ioawDcro1cVn
         awt6K3bqFYVh2MKXqLFQ9+evXKYAOQ7jCZ2e8zdQwzs5EtRD2VpyV/Dj18e2JgHGnC+2
         zVgqZy0EzKcAvgW3C82+Fld/KvIvYiIiUaf/v560gCvau8EZ/o0fROq5Vh++fy0WAvOb
         G3JS/5qJjosu5rbYbfAjeYQJ9N8Vy116EeTvS+kM9vwHP1Nw33n0NoRdAPlOOHWe3L1B
         3aoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e0WA+1xWMmwxJhQG3lcP+OMC81WDVxu32cEwJ7yzLdU=;
        fh=jaOQmaiH0e/fk5BUfV5y6pp5uP6XQo8iNSshIfXiY5U=;
        b=UbpeyXYJ3FDZVsVE0vpb7uFj1JEBYC/KEdkMVFI8/A6UkE3Ch7dj1cY0S8CQ5yfsRH
         FxMEcdQ1A153eL4DyQssW+JOM1gG+sGyeuEd44B366krcR9zTTTIpnM8FUxUG6ry511i
         LPsVxJRLjqikwy32Bg7h9JD2PEO/pCGUXUV6gwJkwuxsZrA/AUCLEL1+8VYZcyNAGakh
         1g/7S/gazRA2+kKCfAmOGndX0KdnXl/rm6qtbwUPFaHvHc8NtksLg9DifmOqaJfBHF4w
         IeMZuSoWYCNfJFaz9eu2SMtREOvbEJrkTJpAj+Y0riQ1nomU9jVR1tVHjT+Go5qZef5l
         ExzQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783386373; x=1783991173; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0WA+1xWMmwxJhQG3lcP+OMC81WDVxu32cEwJ7yzLdU=;
        b=AtsURakAHp/xDKQez75k8nBzYIAFXJMvrXn6Ntd/Iv/EgNR8nAJ+w1NRmmh3KEa6je
         0syQNz9N7Tqp90EhNIV8uZ5VFfYdZRuPeoV2OBiIdxkat/Cr7L7/AnmyJ6VkA7MLpCJ7
         cpgkQMwpzV4nFfmCoH2TwlGWsiLrgXFAGtO/IbexBjDeSvMdDQSXe6mRNAOgWo7de69/
         KJoFFFO5UgjzY02gzpzVz7IfW5aPLVTvdXV1tKHmpLQABkGfig4IWpuQmdywAFlhGMNh
         1IpAjQtPH3dBYmrrwInqomYTy0+F76gsEhpQrhztuBc5PNae24pYjYsnPuaGoDQrJKup
         kSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783386373; x=1783991173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e0WA+1xWMmwxJhQG3lcP+OMC81WDVxu32cEwJ7yzLdU=;
        b=kZQkJsqmkGyfPXuVc/g9I1+6DUg/Ma6YAHfjmx132H1G6y2fhGcqqTj4tQQui7l/iA
         kIbqA+ftcR2i0zIi82U13WOLc4XIuQY0a8xgQ1dxJrWGsSCySDFi6b2etLha2IaQlhFv
         UtQL2y+UhnE8s0ZAvzwOqUxn3gnmr3DvPGsDI0bMU1GKLxLSx32LQnnlb8k3sYYADAO7
         NK9YMe5SsQORpv3M0Ua85GAMvEFMEfbu3/eLdbhpa7k6neWC8167aPc7WGVd3bvtq6SL
         c7ZPSyz328tSo+ly/Ecj100QW7dFI6pSvxg8jztdhiNmtsKYwjj55H9V54ifEVIoohYl
         7ieA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9TJNqVLvL+RYSMYtqWS7TBA87lVAYTEVUG7ErkiH643J1E8wXEwX9dzXhMFG2AtjA9XJtIa1At6jE@lists.linux.dev
X-Gm-Message-State: AOJu0YyqUr73X4tUcwaXDg09Yw/fnoE39arSd4souEuz5HpDbe0ZMQE7
	L1pD0Hp4oo/zgY7Cxr69Yb0CKl4cTb7paM6srXqQ/sz3/5Vs+U9P5JGc8DLGf/iuSU16A6qADsy
	hbMCRwnW7GEuUZkI+F5a//N2FXY+UA/A=
X-Gm-Gg: AfdE7cluFsOkksgjJHkXTP4PMO/YzD4Cl0q7VS+CRxwjXwQ6hcPIzA64xV0lut7Eh1e
	eMlgsDau/NNa2ZhuCeSwPZfHjRBOVSxtCk1Y+Hken9sIy6UJrGoK8Sof3MQMjFlyS+QthT1C3WG
	hBZ6p2mAyvZEz/lOCU3UO74OYaAefBd2V86Z45NTLKRmvB0/5MsljfLlhyOA0iYHeV0rPHdIgGD
	9nVzw3QVBeQLmYZkCvrlsh82iGGNK5JQg8y98l+G6i/+Crw/hbfdzDawoBGHBMsuqNX3FVavdh+
	zXb3xnuZPKIKJviz61k5MRPGYM9fidc386iipGjAmKF4lxvcmyRoTd9Gn//ogR0xiENRsh7o0w=
	=
X-Received: by 2002:a17:906:a2d9:b0:c12:cacc:92c6 with SMTP id
 a640c23a62f3a-c15a699604bmr108442866b.59.1783386372722; Mon, 06 Jul 2026
 18:06:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703092815.4602-1-swethav0411@gmail.com> <CAJnrk1bxAfK0QJQtQ213T0ZKhXu4Pi=2wfRfZ5u0_frC8bucDw@mail.gmail.com>
In-Reply-To: <CAJnrk1bxAfK0QJQtQ213T0ZKhXu4Pi=2wfRfZ5u0_frC8bucDw@mail.gmail.com>
From: Swetha Vadlakonda <swethav0411@gmail.com>
Date: Tue, 7 Jul 2026 06:36:01 +0530
X-Gm-Features: AVVi8CeXlaZFCuhFG6NwSUSQ8oaTkB5rs31sBMoBozWu9soJY8C4jbsGkGRjM28
Message-ID: <CAAoLz1fpotiSjFcthTEMZEAaKbhtd0poHC2w++eWMCa-euoKbQ@mail.gmail.com>
Subject: Re: [PATCH] fuse: add folio_max_order and folio_min_order controls in fusectl
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 2:40=E2=80=AFAM Joanne Koong <joannelkoong@gmail.com=
> wrote:
>
> On Fri, Jul 3, 2026 at 2:31=E2=80=AFAM Vadlakonda Swetha <swethav0411@gma=
il.com> wrote:
> >
> > Expose `folio_max_order` and `folio_min_order` entries under the FUSE
> > control filesystem (`/sys/fs/fuse/connections/<connection_id>/`).
> >
> > Motivation:
> > For fuse based systems like GCSFuse (Google Cloud Storage Fuse), large
> > folios gives a significant boost to the read performance.
> > - Without large folios, single file read perf is capped at 3GiB/s
> > - With large folios, we are able to achieve 12GiB/s, 1MB blocksize
> > - Writes:2GiB/s with large folios vs 1.6GiB/s without folios for 1MB bs
> >
> > We understand that subfolio dirty page tracking is not available for
> > writeback cache with large folios. However this is not a blocker for
>
> The buffered write and writeback paths in fuse go through iomap which
> tracks subfolio dirty state.

Thanks for the review and update. I was under the impression that not
all changes
related to subfolio dirty page tracking are done.
>
> > GCSFuse and similar cloud/network-based filesystems for the following
> > reasons:
> >
> > 1. We generally recommend applications to use larger io sizes (>1MB)
> >    for writes because of the latency involved with the network calls.
> > 2. Random writes & small overwrites are also not recommended for cloud
> >    based filesystems.
> > 3. Beneficial when write back cache is explicitly disabled. Incase of
> >    GCSFuse, write back cache is disabled for different other reasons.
> >
> > Providing these controls allow individual filesystems to explicitly opt
> > into large folios once they evaluate their specific workload patterns.
>
> Could you explain the use case of this granularity? The page cache
> already adjusts folio size adaptively (eg small/random i/o still has
> small orders, high-order allocations fall back gracefully to
> lower-order allocations under memory pressure, etc) so it's a bit
> unclear to me why a tunable would be needed. It also won't enforce the
> order for any inodes that are already in the cache.

Our primary motivation was to give fine-grained control and users can set
it as per their workload requirements. But agreed on the fallback strategy =
and
have a single on/off switch.
>
> There's a patch to enable large folios by default [1] and the
> benchmark numbers showed improvements all around, so I don't think
> this would be something individual filesystems would have to
> explicitly opt into. Does the change in [1] suffice for your use case?

Yes, the change in [1] completely suffices for GCSFuse.
