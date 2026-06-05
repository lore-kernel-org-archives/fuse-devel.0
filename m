Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF5917BEBF
	for <fuse-devel@lists.linux.dev>; Fri,  5 Jun 2026 16:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780678584; cv=pass; b=ruuzaj4ti5rdYyibffAmvDE2ypZG6X/7lQj88TejE1ge9v5PZQhmfnT2LGsp5xp2HHGwuE6EmdGopa9u/WPUMkEKit56M9IBN8Fhlorf23o20lM6P9psKiDgWRfwvmWyU7CYCRUi6U/SniPH3bIJ+u+FrwzPl+crHimNRWGWkdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780678584; c=relaxed/simple;
	bh=lRJhQzwkfaYrurGJA+2BHiGqjhVOLsD9M1oQ+MQYHk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TlzXe0voaqNslvuuw+oJ9wYmWInHMw46X4zCs5QAPMyNkqJiF9E3wmp1xuL1p43kUS+Hm44p0EmS50UDTLuZKQfhq8BnYLBUCzfg/np55lZi5XUBPX+v8IvMdRPXz19g3W0Gdr42UUJIzu9b+dpvw4zv01u343Ag8gPLlfnjoWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sSctHsKl; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sSctHsKl"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b3637b90so18969365e9.3
        for <fuse-devel@lists.linux.dev>; Fri, 05 Jun 2026 09:56:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780678581; cv=none;
        d=google.com; s=arc-20240605;
        b=OV+j90fWwtX6YVKthciUCOWm7m2IUAruY93AIgxhCk9Z1eYU3bOyL4rBuKZGbErrxm
         EnLa4x/KukVE/cPU6zA98AegTFCJCIsK0mernUIsASaSvOCn6o3voEXhcND/gr9zO70V
         pZH+oxIvAs++p2Q6ThM95E2TRKtVsZYuezxqQeSr5CCVPJ5Wky+A3rpFygMmpJz6VmcJ
         c3xWBPBdIfwu8CT9r/XQPKjHYjPTFlUUvVh4SaRyORk9ztn0fCuSTwGfEzOS27LunD/A
         JHIX8LII0/3wy45Rr1ncX2qkbpMH6E8KLpuyYJ5xSH0fSkMAlrvNNMQks6xCaVTJT3Xo
         20Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EImzJsYV05pjesNEMZOO/uQn/Dz1lGb9i9aAN+v9i+8=;
        fh=zzCAkyNDTlvcS58yXENlTk56hIG15rUGZwiy0spPZGo=;
        b=hXKCh+4AIYRLJZ++djNrtDm05N7Gm5CIqPxNxd37LHf0PfUkgtYS6Ze0bYYxDPuBdF
         5NyvLlHDByv7sShN86j9MoNbSmpkvpIXwft2oYoeAwyjlbjhO3T1PSSYnu/aO2/mk7tQ
         E8/dg6aijtPmdUAqrU67EI2IByubj98UXhCHG75iCsyOSnK4f8g+jyw574bQ5TP+Wi7m
         MlPzai/DgbBVjC3b14L+tEj9KIhMAZpwgt9f4aBaEmIDrWnr4wHsPTXQ6ge4kh250trz
         bC3M2RYpvjNuJj7apny5xxS6qpwDEk2qGiBQEdbGYJJAZnDHs/ZeskynncZhCncqHTPB
         z/4g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780678581; x=1781283381; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EImzJsYV05pjesNEMZOO/uQn/Dz1lGb9i9aAN+v9i+8=;
        b=sSctHsKluYSkYYjHzMzaEHgCvJ7rYpz78O1j/VXfscs6ASE4t0GrbWFttgjAY4SKZT
         La2AWbQFcQ6CEP/1Bd4pAtUxaLFPuB5wVzWraX3u65Rfw5QkKkamrnEZ1ZzDrJcyXrgT
         /um8QFAtMJC4P2xZI0JXDq3RtuI1SIOk0O7ZkP8xvhlh1H9g/zAVYPNPbTbt3UqCktqS
         8P/+iXFFvlEKT2lQBVoqtGvbfDJ4TE8w206sEov2yQK7pzqXYBr+tyqhMyaCJ7VIXJfQ
         6cKUXBQI16keOsc0nEgpJ0U29JRiTenTBrOI32IO4r/tMCAnwCQ63cGZ9LNFSDT1jR0F
         UeuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780678581; x=1781283381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EImzJsYV05pjesNEMZOO/uQn/Dz1lGb9i9aAN+v9i+8=;
        b=gVVEvMgrZ2ksVmLyl9bPnMEoYNHNSnuZgRRaHBHeU3++tlF77N/MkQQUgmdKdFsf79
         1PV8s/Ilzn2BlM74hP3n1DfXIQb+Ffk9lyQeOLy2aWQJPKu283DXQEhLKMzbM6uvjBLd
         favtVTSG5Dpe+Ky/QkJG/Lr+MpKglcp95tN9P4Qw5dgGJIud50AI8R29SkHCW6l7wTEs
         d4su4vFTLJKMnH33Ay4O2KuP+B4B5CYFdv5p6PSjMn3krZoKEJCudVWRwHolYx2g1Prp
         8eMZ3aKEDWE8PHVHTi09gcKRUFg4MMInZ+Cgj3BDcug3QYiZAoGhJbFT3yA1uk6WEz7w
         WD6A==
X-Forwarded-Encrypted: i=1; AFNElJ/vlWNBOIiEsrPZbWPZJfs+8IJaw+Mb7V+ojzTzBmwzdQ6JlGN4E+sgOcuylrjCFR3Kyk7DCLMKpJ16@lists.linux.dev
X-Gm-Message-State: AOJu0YxB+Snh+XThl4gQRjKavM02nAK+k9ah25SAWUFpANns/v0Wg1PS
	gbgFvqc4AdwIgXc3mjf3va5UGPJNAMuEuYDugKhUeyfYYzwxgLCY8JNNsi/JXJazweDRxaLXV5B
	WgRMYfOfuakOCnLFurXCnTjNAThnx5eU=
X-Gm-Gg: Acq92OGu1s1ruKKKYM2v0Wf/hDR+LYMxc2bzl9XnTbyvYnCxaddwl28BjrC58OWeVd4
	T3gpMjeV2mj210loMhAOdxYySJIN/vyfE5VEiGcKpVU1iF8eQP7JgFOzWTLQanTKQU4m0E14VgA
	KqT2PXMFoer0GPWzI5zdnmV23pjffdnfAARGya76War8AOh8rW8drNJ4VKLBpmx5+WtLCSIuCsa
	0QJhtWaGeAGvIoSTL2oL37/F/g1bpUgpUvKYUMdn4O4WTTRaWht0lUTV9m7rwqrpIRYUayIvuef
	FjwdTKHOnqEB7m29
X-Received: by 2002:a05:600c:4fc9:b0:490:c015:21 with SMTP id
 5b1f17b1804b1-490c25f1634mr72764995e9.20.1780678581230; Fri, 05 Jun 2026
 09:56:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <177922946123.2439242.16666495969848656301.stgit@frogsfrogsfrogs>
 <177922946329.2439242.17189876954349215664.stgit@frogsfrogsfrogs>
 <CAJnrk1bvmZ0htacx8sqZ+aBVVS_x+7kap77SEctwwB_F6ttsSw@mail.gmail.com> <20260604235304.GI6070@frogsfrogsfrogs>
In-Reply-To: <20260604235304.GI6070@frogsfrogsfrogs>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 5 Jun 2026 09:56:09 -0700
X-Gm-Features: AVVi8Cc7CvtLmSAsLsPgbFQJh3fhoENrv1QvAhnBDonpKbY8QJfsAGPKasyWKTE
Message-ID: <CAJnrk1Yvcet5rqUHLPxgf=YxMG9Lw_-eKkMdXak2-5jchnUq-g@mail.gmail.com>
Subject: Re: [PATCH 7/9] fuse: invalidate ranges of backing devices being used
 for iomap
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: miklos@szeredi.hu, linux-fsdevel@vger.kernel.org, neal@gompa.dev, 
	bernd@bsbernd.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 4:53=E2=80=AFPM Darrick J. Wong <djwong@kernel.org> =
wrote:
>
> On Fri, May 22, 2026 at 06:29:16PM -0700, Joanne Koong wrote:
> > On Tue, May 19, 2026 at 3:32=E2=80=AFPM Darrick J. Wong <djwong@kernel.=
org> wrote:
> > >
> > > From: Darrick J. Wong <djwong@kernel.org>
> > >
> > > Make it easier to invalidate the page cache for a block device that i=
s
> > > being used in conjunction with iomap.  This allows a fuse server to k=
ill
> > > all cached data for a block that is being freed, so that block reuse
> > > doesn't result in file corruption.  Right now, the only way to do thi=
s
> > > is with fadvise, which ignores and doesn't wait for pages undergoing
> > > writeback.

Rereading this patch... (or maybe just reading it correctly for the
first time now :P)

If I'm understanding it correctly, the problem it's trying to solve is
that the block device has its own page cache (separate from the fuse
inode page cache) and when the fuseblk server or fuse iomap server is
unmounted and done interacting with the block device, there's still
data in the block device's cache that lingers - is this correct?

Is userspace not able to handle this themselves by flushing +
invalidating the block device's cache with the BLKFLSBUF ioctl call?

> >
> > imo this would be cleaner going through the ioctl backing interface
> > instead of through notifications.
> >
> > I was thinking of something similar in idea for this for passthrough
> > where you're able to dynamically update or invalidate a mapping
> > corresponding to a backing id. It'd be great if we could both use the
> > same uapi.
>
> What do you mean by update a mapping?

I don't think my previous comment applies to your patch - I had
misinterpreted "invalidate ranges of backing devices" as meaning
invalidating the range of a file that is mapped to a backing
file/device.

Thanks,
Joanne

>
> FWIW the functionality here is a lot like POSIX_FADV_DONTNEED, except
> that we actually want to wait for writeback and tear down all the folios
> in the range because it's mandatory, not advisory.
>
> (TBH it's more like what filesystems do to the pagecache prior to a
> fallocate punch-hole operation).
