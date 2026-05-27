Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B953F54D8
	for <fuse-devel@lists.linux.dev>; Wed, 27 May 2026 12:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779884727; cv=pass; b=Dh2WOhTyT63r0ansOX0SuunUkefhjBfoSXzNx/XtpvhZ0U6bgB8MqUXccl28xemzXqKhZeETOGduPt9HQaytSDyAVWm1ATVuJjX8PHj920JUUOmzHN147l3Z1tj5Lo/OsqR1f3R0ByrFWXAqdUWYj2wKUF9cxpBPhR4+UzCYpAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779884727; c=relaxed/simple;
	bh=QH7X6mMUgwH11C8C0NwSvhdxKEnW0MUqm6E18WiMtpg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OEJprEYCMhD6Utm3pmbuSjRD/AcDeVFJZaSKVhEMWBqhZLQKCKsRMFDtV4fLpJAU93WH0+6xws9zfRUsXhgFg4xQXQlvc94d5jgg6bZnvsfdjVaYVv3gDIr0I12E6eZ2g8Ardubh3SHqmQKkw+VxeSFOQZ38PJpEwz09NV9izik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=Sp44t0Lx; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="Sp44t0Lx"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-516cbe16bcfso41795381cf.2
        for <fuse-devel@lists.linux.dev>; Wed, 27 May 2026 05:25:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779884724; cv=none;
        d=google.com; s=arc-20240605;
        b=GPojiI8hin4s/WSgB16xVddFQ6RNGL2IeIY3Y2yHwp+189NW+Sd/BkpNHzyhM74mEq
         PvkBWBmhmzM02JNDcaGqC7Jd0mz2gw+gdZK8Mh9864C2zgzAiNpC1TAY1wdAljhA7bD9
         638adCywmZXlDlgcH78JHP1HWdQHq2pSWRwkNVHJfeLQCahuojxk3o/JNf9/JQd64Q1W
         yGKa2Rkzdpg124mYuGoehPkYQQy4jtGRuyU8V8DmMemVmpoZ5UQZ84BefP+YhPRo1xoe
         HY/UbTMWksSfaX++2iT02JHiEv7THpdLv14bWAphTqCWIEfJ9qnRDOSiSt0QjNkQ6LF1
         4O2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=w7pZrxFJNQerIMty8B6smj8HjW+76z4MVN8D/42e9J8=;
        fh=hPMFjvSiEJNFdmNM45Vugcak4l4osAMafAU5Du7IyKc=;
        b=DEkUciNlDIYUYMqWzDcAGwO6kzewD5AhE7zorih+SB7KKz8WZ0Gu4X2CbufkKVDZI/
         0aLIwMV8mnzbGIknr5fDHRY0imjK6PGeFjfj+r9MHq+aGqMazS0Dhd2UYCNPUMoIn9Wa
         9TwDrzTBWRPq0f3D0XoZunUDiFATuu840QIEoOAjwNAaAEsArInh5AszHBZDfciZuqzh
         SOIbv2wxIu1rWazC1AzdQOrhesGsDlY3Difnq3pCk2SuC1reGum5tStTl/cndpcf0/kr
         x9LEhn7OBC2K3q/l6z8CL2HGyfliG9NLiJb+NXHpX4kZal2Gp/olMmaD6sKkufOhGl2C
         CL7w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1779884724; x=1780489524; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w7pZrxFJNQerIMty8B6smj8HjW+76z4MVN8D/42e9J8=;
        b=Sp44t0Lx6oy/xhpQfKzDh9htzAEUY6nzOxfRGTfuGZNteg3K6/cPD8rQ0CLtI1Xu3Z
         6UaBK3/RekNdj4Lfs1PHwP7wrhJHPJQiairuq0OaEds+057NjuTwFPqrF89AHBRqH+WM
         HXhoN/rBpSoVhzwFSpMy8caL4aX36tcudl/40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779884724; x=1780489524;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7pZrxFJNQerIMty8B6smj8HjW+76z4MVN8D/42e9J8=;
        b=GKx8yWz7hQZlnIWudkwpLK/SADSEGqkmmp5qvWgpUsXGvUJaADiVwOVTiO46KjMiNE
         uAMW/Azeke3+S/7mM477YKV1LtNVXMeVRDa5xY4o+nrGgj9aZYWU02T4taFHzjugS+XJ
         iiD+Dyb2iiadmpc33vS7SyOLrvcP0aeGQUGGizDvHF9ktiecuhns8gp8XkHHDDEy8PpI
         xBnWKvmKo98F7IQOK874zHZcgHGyO9EMG8E0JNMOx5n67KwIOjG7i3oWOguVHwYg9p/R
         imFuig+DeVj5RMhCPHjU5DvdjsIqCs0cK6GeyfovpPPkZZNXYY62A8T/oCO3I0YGw6x1
         STMg==
X-Forwarded-Encrypted: i=1; AFNElJ/L6NupxDXc8L/QpCqJko9uc70ZynkU7wzWkJd6EOYLPdWfzbr7mt7e5Q1hY01SeuBd7FxdKvQ/IeZJ@lists.linux.dev
X-Gm-Message-State: AOJu0YwFoIBRUUt1fwyxYmgF5b02nR2XpUOejuNzlm+dg1Wk391iPsDQ
	84I+Ly8NRan3EoI2A9Cnv3nhNrAuOlUkuXh7NLMhLu8DM12VcOEOtFfkEbrJc0hGU+hBmhxE35R
	7lx49PgNFCuIlBRkL38Psn5CWPfNpsqr7o55+OX2Vrg==
X-Gm-Gg: Acq92OFIblElYO1GYxfkvrFgv4z3hkrn+UJJTEob6jiQoo6fbtzYT3GFp4hu9Iiv7h9
	kBNPNT8eTxmiUJNpcWfsJeqpIpJ/5kOGiimkqoSJvknwhAcz+crS3H2AmcXEOE15lYZzjxHog5b
	PwTjTfJJUAHWbt6PA5ztPGGeRvLJhWqdv+HlVdJRsetuYb6LwTVBIapZLBvUBEJpeIrX+bKl7t4
	WsZp3VEEmvK61kwUgTbMxwHDd/03vMCr5u2SKV+FG8lnjFamMMmX69lZpPsv/50iz7whTeM+IW3
	3t8ot5AEB47guX4mowYBaiXFrXp8x9ARwjAAsB8=
X-Received: by 2002:a05:622a:4019:b0:516:dd65:21af with SMTP id
 d75a77b69052e-516dd652495mr249087861cf.45.1779884724159; Wed, 27 May 2026
 05:25:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251008204133.2781356-1-joannelkoong@gmail.com>
 <CAJfpegsyHmSAYP04ot8neu_QtsCkTA2-qc2vvvLrsNLQt1aJCg@mail.gmail.com>
 <CAJnrk1anOVeNyzEe37p5H-z5UoKeccVMGBCUL_4pqzc=e2J7Ug@mail.gmail.com>
 <CAJnrk1bx+32Tq5DOk6=C+_smV2HgP3+RT6gpYLSNMEirFs_EkQ@mail.gmail.com>
 <CAJfpegsy2XRR6g1J4Mg0MXPckx3NVprW56XvYhEko0=7PcHiQQ@mail.gmail.com>
 <CAJnrk1bZX44HaXmNMxEeEwhuFHgEjxXLnjKy8a-6T6LFuf+K2A@mail.gmail.com> <CAJnrk1aJwdY+fphnhHjAXFwjGqWQgVB+sn2Ce0gReein3H8EWQ@mail.gmail.com>
In-Reply-To: <CAJnrk1aJwdY+fphnhHjAXFwjGqWQgVB+sn2Ce0gReein3H8EWQ@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 27 May 2026 14:25:12 +0200
X-Gm-Features: AVHnY4KwHDouTYGOUbTjVfFUD291DFYrxTCujWiChCCBfK7Jp0CgOE__pmRUeLY
Message-ID: <CAJfpeguAvw=GTkWhMsjSAyDx5oXXfMLNOPGDUg8HuPRxjppxkA@mail.gmail.com>
Subject: Re: [PATCH] fuse: disable default bdi strictlimiting
To: Joanne Koong <joannelkoong@gmail.com>
Cc: linux-fsdevel@vger.kernel.org, kernel-team@meta.com, 
	fuse-devel <fuse-devel@lists.linux.dev>, Jan Kara <jack@suse.cz>, 
	Jingbo Xu <jefflexu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 May 2026 at 03:42, Joanne Koong <joannelkoong@gmail.com> wrote:

> On a 8GB machine (with assuming vm.dirty_ratio=20% and
> vm.dirty_background_ratio=10%), we get 12 MB of freerun, 4 MB of
> proportional throttling, and then full throtttling starts at 16 MB.
> With 2MB folios, the 4MB zone between freerun and f ull throttling
> doesn't leave that much room for the balance_dirty_pages() logic to
> adjust the dirtier's speed, which I think causes the writes to
> oscillate between freerunning and then being fully (overly) throttled.

Some handwaving: would it be possible for the folio alloc logic to
modulate the folio size based on how close are we to the dirty
threshold?

E.g. if the number of folios to reach the dirty limit is less than 10,
then start allocating smaller folios.

> I think this problem gets untenable for random writes with large
> folios, since dirtying just a few bytes will charge the whole folio
> size to the dirty budget. I have a patchset from last year for adding
> more granular dirty/writeback tracking [3], I'm going to pick this
> series back up. I think it will be useful generically, not just for
> fuse.

Tracking partial dirty is not going to help free up those large
folios, unless the dirty part is migrated to a smaller folio.  Not
sure if it's worth the added complexity, maybe...

> For getting this to work on fuse servers with strictlimiting, I think
> the next steps are to
> a) as Jan had suggested in [1], come up with some heuristic to
> constrain the max order supported for large folios for these fuse
> servers if they're running with the writeback cache enabled
> b) benchmark ^ and if there are still regressions, then we should
> probably just turn large folios off for these servers

Definitely worth exploring the characteristics of the current system.

> c) add the granular writeback/dirty accounting for large folios
> d) look into improving the balance_dirty_pages() throttling logic to
> handle narrow gaps between the freerun and full throttling zones
> better and reduce over-throttling
>
> Does this sound like a reasonable way forward?

Yeah, makes sense.

> For privileged servers, I still think it makes sense to remove the
> strictlimiting requirement or at the least, let admins opt out of that
> if they are confident their server is well-behaved.

This is already possible via the /sys/class/bdi interface.

I'm fine with introducing a config option / module option to turn it
off by default.

Thanks,
Miklos
