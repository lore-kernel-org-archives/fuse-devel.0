Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35314394788
	for <fuse-devel@lists.linux.dev>; Thu,  4 Jun 2026 07:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780558783; cv=pass; b=Vkv7tVl4uvXY1M/vlnbLC3OP/ygA6E0qefMGPQ7Ks5Mn++bWsbAlWlouU/fjvdDYgVfdkO7QQXJoV73GYrdGdepMR9CuA32A5PYClzBEAwxO7WlqI4QAdVfpwjUiAq/tLcPpuHv/cmvLbm7omCZxyuSOsqWGQM/FUbD+v0FPxKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780558783; c=relaxed/simple;
	bh=e+K8JI98tjf5hP5bAgSr4Jd5kzHe6QJIzHF3gbCUJH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gJeVSyUGTzdd6+JxJn57gIgjPRiC2947jyJGl2+qVoHci3LM9MqHAtUPtLNheSTv4dYNZefMXrODMCMiFFRjSWEDoG06iSnSi0nqlrXYS6MWVjib+zf/Ccs/z8BKK9v3MobnlhX2AfIdBSxrjPyEzvT6cT0WBwpLweuN+9V1fng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OoFWqNIM; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OoFWqNIM"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-687ed9aabb3so726850a12.1
        for <fuse-devel@lists.linux.dev>; Thu, 04 Jun 2026 00:39:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780558780; cv=none;
        d=google.com; s=arc-20240605;
        b=BK99rpWokDsGJnz0KQTZa9UPvR+x408sN+Cb8E62VQ+gzBJmBl3jIe0TXzppmhIa0J
         fG8APeR0G/9r5v54jem8/hd6yoLDEzneAdyItZIzgxID4S2mufE6PlJVy2UwSXbryqpI
         XMCcZ2NK2emEmeZLwmFFSU7SJLnpfuXMhxSYKXI8m+LphA4VDVhKtKuvSTSW0ieCoCIj
         etM/RelzLLT8LI7EgZWkds/VGm5UbVoxYDt4XSLbNRhrSQphDXG11kzC+eJHnXbtEn4X
         XkD6o5lsMexen7Y+PeBlnpHNBpe+CgX6gDchgvKgau607q3q8MevzYJHnvxVQoJ+7LlG
         559g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bh+JpTqn5WaQ/HfI1QK63mlUNBVv/IjZhQGAlbMSN4g=;
        fh=NJGtx/Zmmc35AWu4mPfD1iuEsLvw/5WY/yFozn7py6U=;
        b=WLX7LTMhAqILf248LqZRRc4gceqnaUS+mEOLzAMmPzjQYHhsP18CpAUbQTO4e/WiQX
         ylrVC0lUmxtUKo6eZuLQvEROYgJPzjiGw3vpa0gE84+oZJUP5MPgFQp1EAEFahpuKIqe
         k8fc24WhSONHatAcST/kA83EvGDLYbaVawf6YBAKcW4f1dx1+plRvSr4fjQyWOsFzhFO
         UHiqFbMryRbEoAVK+WrfZj4/pel9rzrYN/Y3J4vPSABoY/DCmx2XV/fDj616BPovuj83
         i6Iw408UQaQuEGd2eypsqRjiU6uomgf6oeqnZs/vcgTwBeB7dnBm4xD8cyFRs/o/sW+S
         gfOA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780558780; x=1781163580; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bh+JpTqn5WaQ/HfI1QK63mlUNBVv/IjZhQGAlbMSN4g=;
        b=OoFWqNIMrGVlG6NrZnDvw5vqpUQFiLugfHSL377s+Or3zV+jRyYmLonQMkrK+kqYKM
         P/5Q8lCO8j5r6PMHKnMkS2P2/jF9GtBlJ1nZUzYSZgGwNU4VXAp1A2ck0eZUPJHXvG3H
         jPUP2iHEK0eY+++0oL7ONnE06khSb4kW7OPUmUU5Gef2T3jKgVzPGD13Vm7Z3LP38Nwf
         PU9wSp1aIU+pUWPfozOD7PFip12mJ+k6Kpb8XaBj76q5uD6M0zDxDmOdH1K4/kYlzYdN
         vSJ3hK57dPGT1yEjdNJAoZNq/2iE4LviEd+MjftgB4WhH3qNd9cyHQZV+az7B+VsgksJ
         ZTkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780558780; x=1781163580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bh+JpTqn5WaQ/HfI1QK63mlUNBVv/IjZhQGAlbMSN4g=;
        b=ZKGP1tS2FP1BV/4K3kuzbCZ+KePZC/P34ufoQhhs5avBfs6ClmWpoSvxQzTI3MR0dz
         UHn0ohi7sM6WkKXFqxW0zQMxOAw99Xx3dWOO1QrCeAWqnP1UjNc5bCUn/OICWxljBu6a
         ltPGv6IY/TutNOxu5pEKc5YoIqGpbLkYGVN4vkbqtORccG+nJIHUkIXm1aRiwY+LCs1P
         6zc0TLawymYOHN+DOJc6cQ0kGcUXlzyyynobIqhd957KVYyCWBhKIu2Wx+uueDWPyX/V
         Tqouuch0mqplWDGmSyi23rX3DUQlLJbWHNBqclT8FgF2P4IfT//jXuS8/vGdLLHJbPrA
         xc1Q==
X-Forwarded-Encrypted: i=1; AFNElJ/EYMAy6e5s3qNf4+IdJkbOk88/9yuOzN3KpL4hMbxqzxFf/dtj4Zu2VXWNt51ywEmHxj+d1Y+/0qks@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3f51dbEn34q0AnYn7/sYRUhA9cImsokjxCRqMRO7x0PjWRIGS
	btvpdrQ4soY2QB6BrdCYJJmcRDgLMSe7tnn33TqMuBFrQMp+pDEk8N3luEAi4WuJ4fJ8aERFbbz
	Eky3lJE0Zgdbqij9TV7Wf6pPUTmmKoAY=
X-Gm-Gg: Acq92OH8EzwpKHbCv2l5P7lSteoBn5T31I7R9DySzObeDCKh2vCxCKYEcV+lKGdpob4
	tdihHt+XVuqTktPHl8DDo/a1Zc8K3OPwAazPv54j3UYL1mvqYvXZ5ChlTehnN7aDw3rzIFzoNrK
	Ms3jPdHZpGnQcro9hJoLF4LsuukTTQMyGzj6Su4/xyXGBEeg7jplJPUrQhc49RsaU5AUYLwF+kj
	x/RbKcxRaUUFjzUW+RaxUbUVuCdGZovQewb4usjnQfON40onDzyUQN14a+poNDJGaEIvFW6roaL
	5Rzt3PsUKZMQdeb5xtUSkV/CjTa/tALvsXsBM59vJBpqHaOG/Uo=
X-Received: by 2002:a05:6402:4486:b0:670:8acb:e822 with SMTP id
 4fb4d7f45d1cf-68e70ce79c3mr3510055a12.12.1780558780334; Thu, 04 Jun 2026
 00:39:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260601152327.2069787-1-mszeredi@redhat.com> <CAOQ4uxjFg4rjwGjU2LvZT6AhC+gBk_6Ej5S4p4DKuk8=a71cRw@mail.gmail.com>
 <CAJfpegt5Q0nmK0JKAfa4Bp_SydR1qiqu7pB0JKkXSCFOYSVDDA@mail.gmail.com>
In-Reply-To: <CAJfpegt5Q0nmK0JKAfa4Bp_SydR1qiqu7pB0JKkXSCFOYSVDDA@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 4 Jun 2026 09:39:28 +0200
X-Gm-Features: AVHnY4KAGkPR4XMrGJ1v2HaS6C6G0nzM70KVbpCrnsTsdQpjDfIqLFHVtkWLhqg
Message-ID: <CAOQ4uxgc_pW57_xeHjm6xauB3Cfx3ZY3Y-NaXO_xvL==vKcFOQ@mail.gmail.com>
Subject: Re: [PATCH] famfs: FUSE_FAMFS_EXT_INTERLEAVE -> FUSE_DEV_IOC_STRIPE_OPEN
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Miklos Szeredi <mszeredi@redhat.com>, John Groves <jgroves@micron.com>, 
	"Darrick J . Wong" <djwong@kernel.org>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 8:12=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu> w=
rote:
>
> On Tue, 2 Jun 2026 at 15:21, Amir Goldstein <amir73il@gmail.com> wrote:
>
> > Considering that John wants the daxdev ids to be allocated by userspace
> > I suppose the number of daxdev ids is limited, same as with iomap
> > backing devs, so we could probably start allocating backing stripes
> > from max_daxdevs (1000?), to be negotiated at init time.
>
> This doesn't belong in the kernel.
>
> If we really need to have allocation policies for backing IDs, then
> just move it completely to userspace.  I.e. pass the backing ID in
> fuse_backing_map together with a flag (FUSE_BACKING_ID_SET).   It
> would make the open/close more symmetric, and is a nice flexible
> interface, so we should have done that from the beginning.  But I
> guess we opted for the kernel allocation scheme due to its similarity
> with file descriptors.   Oh well.

fds also have both dup() and dup2() ;)

Yeh it's no big deal.
Auto id allocate is a convenient feature, which has cost us nothing
to implement.
FUSE_BACKING_ID_SET would be just as easy and would not
add that much complication, just do idr_alloc with range of 1.

We could already reserve the code point for user assigned id
for famfs or if we want to use this in the future and shrink the
ops_mask from FUSE_PASSTHROUGH_INO patches to 32bit
as Joanne had already suggested:

struct fuse_backing_map {
        int32_t         fd;
        uint32_t        flags;
        int32_t          id;
        uint32_t        ops_mask;
};


>
> > > +       res =3D fuse_backing_id_alloc(fc, &bstripe->backing);
> > > +       if (res >=3D 0)
> >
> > 0 is reserved, it cannot be allocated
>
> It is confusing either way.  The (res >=3D 0) is expressing the fact
> that this is not an error value.  If the condition becomes (res > 0)
> then the zero value becomes an error condition, which is crazy.

OK. make sense.

Thanks,
Amir.
