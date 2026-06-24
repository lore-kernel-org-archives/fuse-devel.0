Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F8C3DD862
	for <fuse-devel@lists.linux.dev>; Wed, 24 Jun 2026 17:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782323545; cv=pass; b=hYbIEs7/zaqhopiEyHPqc0JfLKoAgUc6/pW6XDej+g0JoOREDohVfgEwG7g4h6C43V9NfG2kTx0Zj8MfGKBcT0I2/aUfkfm0uYoraTe6C4zUOrMZx+YRVeEUsBm+r1pCXPRxavkaMBRbJAducwhKXXXf/zuFNXZLx0vv+vUuuvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782323545; c=relaxed/simple;
	bh=BUqTLbaqUYoKdg3iiW+mLowzEHeWjN5LiDlT2QPIVfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l2K18MdEOYg2/mjMQiXEr0WlLEPX83UYr25K/hrozq6hbYro73+QC+Xk10tRQdDwChKE18umdaT1rgiQnOyXxEDDapcK5IbI3zmC//qa0e9ROzIppr4BugFVI8zxGyUGAx9JqZTVG+3H7yADw2XgN0Y+/zVk+Q4lHW2acmu/ILo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEQtORcu; arc=pass smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEQtORcu"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-69e46524711so938881eaf.0
        for <fuse-devel@lists.linux.dev>; Wed, 24 Jun 2026 10:52:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782323543; cv=none;
        d=google.com; s=arc-20240605;
        b=h8jiG6bNgtO2QZyzj5N3Al2VqHAUwbf32d8v538khfKZ3rlndwgeKB7wxC52vuBXZj
         ox7axG7R0TWIGkN1AOUP54LgxM55kglRMQ5hzRt6F2nUkFQIQuTJyCSRWe6DibaDqqrT
         rVD9MiuL/RBstwdC/7FwtMcxCCSeOIVtkakxhyr2uHz6gghzMnhZf75hjVeCwUNN4Ay4
         hxJutExdiaqHiD2Mfu556X1ti7dIoRxxw8TKMP1CU9htPLZKZR4okw9Ou7KJGrA1adUZ
         61PUxw+zvbnoJDXgMB7aARo5GVWKz6GJ8hD9KQ6pC5YyyBSZJDyYJOv0H/IFmFcgcmLS
         vPvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3yIQCK+bzs9AyvsQ75CttiaMe1DqI5YJnh3974Pl4HA=;
        fh=+HrIVvYZJKpuMJFSTlMYYTgw08GpIepN23utnf491V8=;
        b=Zjw2IUraFwRW27k/Mha3QMPo4fwC3DFg6FqkVonV1A7BWcn4megkrhZPJB2iowOvpG
         MGJ9DLS89XI1PWHdUo4+TwcHbaTEJ8ov1c+pVLXapiBGaNmrrJp4rGF+heybgUq1UYo6
         irRp4Fr0jJYPWGW1MxnCdx72w9Cq1H6u69XP0HXIDWTKbP0sJVby3cNTO1O5NJSSLuBv
         613Qalr15SvNtNpGyqxgNeMO1LbvLp/C2A/Zpw7BcJSrvtjoziCvU0TJxOBUAkXX8faX
         ihFPZidQ/WOuhGOlJsaC3rlPo2Hqc4RkeKLeu9Mx0txFe2F6+r7kxCRsiP5Rzd1ihbMf
         kWhQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782323543; x=1782928343; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3yIQCK+bzs9AyvsQ75CttiaMe1DqI5YJnh3974Pl4HA=;
        b=IEQtORcu9FfZNKG9zCWq9uT4agMtf7fhH+5Rhd10G+KmSTa5CQL+TF16SB5GU6f4uI
         DyE38MN6D6XnfrJXWuaoQ21BphtZwWbtQvM+zN4mKTEWR2NdZKvtTB8D2mIiHoAOsdw5
         sAVlD0HHnFrtpCnON3zAaLLQV/rzh7kCV3Z32+zRSUpb0aCzYnXc/+cgwecMp9Ocu2XX
         LyPIvYw3I8o444MEL+VpKULIuDEnmODL8WvmTsNxfJlgn5CSl90XW+jLIj7mtOh1/A6a
         edM5yiFSM0Byg9Ckl31QhmJUEztYcTxraAcnyFrukwmuAPV5OKATDrRf/ANnDvzCIbs3
         /7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782323543; x=1782928343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3yIQCK+bzs9AyvsQ75CttiaMe1DqI5YJnh3974Pl4HA=;
        b=AALjMMJ7aNvtEp/eDnzflLlEFelU5WTXrPwcJ0mVma5vrbl5h50Pm+IjFufh84oZ+o
         X7fM2H4LyuvqADyrlvAHVZ0H5JA5j7EqlkPOhjGoLb2ifsMF12bvgYVbwSyz/CgKP8gj
         nKW/15y+gOLF3Cz9Rbnl7OEcaWm1+ztjCvL0YB7XH8C3kQczbY0lA+FcXet0Zacx1d5o
         ZeLrCqYfkfuV3ytbOaKbpWb6q638tpP3Bjeonc9kz2iCsz5XgQg9OtoXwiFiX3+WenPF
         7Gujsnj1YbBcfcKshFt8tFBgoxqd7PB149d8MKgOnsL/gBB7M/kuNnuDSqpzeMlZFZE6
         iE6w==
X-Forwarded-Encrypted: i=1; AFNElJ/Q1QMH7qvp/8+c2U9PGFZkghDrf3Y/KPRxEBP6+lycZMvH/hbloEMs/D+usv5tEpA1c6E7kV4m03dl@lists.linux.dev
X-Gm-Message-State: AOJu0YxjuBQSI1xBXghCPVFpFo2mA4HFqRkm1O97HwwETTNgyp1s/0/1
	jm9Oods4avM5gxO84/VHXzFLUCAIb+5JZkALpXGja1rwuHlHIp8PoHWsCndHwmHd2tPFtDWY1Jp
	2H4i5oYYCjng1JYuaABnyTmQnqQn+W4tIECAY4lA=
X-Gm-Gg: AfdE7ckjVGN4vjILf7uFM9/xKJvCQTtg3s+yumyFtY35ERqa9MuGpzJse2Q1wcFdOU9
	ysupQqlE7RlCtdPZ6Le48sRJLpvhqCULEK5D3U0pz22WNERowd7E4nBnUI28BTB1218ZhKrpB3Q
	/a/Mt/2OT/4ZdVmJ6uqN9Y/GKr/bW1admE76X6QrH51Aw9WCVGjV9YmV0NTZhkkaK/alg7nSdAK
	ycmpMwmk+A97X+i1BnvZlcdvsm1kf/7TJ/mX5WRG1IC73m0MWqZPgPiIrDkBIfasQHDhWI=
X-Received: by 2002:a05:6820:4d03:b0:6a1:10da:ab9d with SMTP id
 006d021491bc7-6a123056b05mr2754013eaf.15.1782323542879; Wed, 24 Jun 2026
 10:52:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANaxB-zK5q=Xw6UZTmeFtXsDZjUsPkFk=p485m-wtNTBnf4hgg@mail.gmail.com>
 <20260624071226.2272209-1-safinaskar@gmail.com>
In-Reply-To: <20260624071226.2272209-1-safinaskar@gmail.com>
From: Andrei Vagin <avagin@gmail.com>
Date: Wed, 24 Jun 2026 10:52:10 -0700
X-Gm-Features: AVVi8CfO4ShP8XHn8pnL2N4gaP9BD3pzKdndivNRe-NdNvS8dpf9qzg05LfmNXE
Message-ID: <CANaxB-xUrLQYGiRJZc4Boi+KX=0TJSWymErNovANVko20fMDVA@mail.gmail.com>
Subject: Re: [PATCH 0/3] vmsplice: make vmsplice a trivial wrapper for preadv2/pwritev2
To: Askar Safin <safinaskar@gmail.com>
Cc: akpm@linux-foundation.org, alexander@mihalicyn.com, axboe@kernel.dk, 
	bernd@bsbernd.com, brauner@kernel.org, criu@lists.linux.dev, david@kernel.org, 
	dhowells@redhat.com, fuse-devel@lists.linux.dev, hch@infradead.org, 
	jack@suse.cz, joannelkoong@gmail.com, linux-api@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, miklos@szeredi.hu, netdev@vger.kernel.org, 
	patches@lists.linux.dev, pfalcato@suse.de, rostedt@goodmis.org, 
	torvalds@linux-foundation.org, val@packett.cool, viro@zeniv.linux.org.uk, 
	willy@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2026 at 12:12=E2=80=AFAM Askar Safin <safinaskar@gmail.com>=
 wrote:
>
> Andrei Vagin <avagin@gmail.com>:
> > The CRIU fifo test fails with this change. The problem is that vmsplice
> > with SPLICE_F_NONBLOCK to a fifo file descriptor fails with -EOPNOTSUPP=
.
> >
> > It seems we need a fix like this one:
> >
> > diff --git a/fs/pipe.c b/fs/pipe.c
> > index 429b0714ec57..6fc49e933727 100644
> > --- a/fs/pipe.c
> > +++ b/fs/pipe.c
> > @@ -1253,6 +1253,7 @@ static int fifo_open(struct inode *inode, struct
> > file *filp)
> >
> >         /* We can only do regular read/write on fifos */
> >         stream_open(inode, filp);
> > +       filp->f_mode |=3D FMODE_NOWAIT;
> >
> >         switch (filp->f_mode & (FMODE_READ | FMODE_WRITE)) {
> >         case FMODE_READ:
>
> Does CRIU actually rely on ability to do SPLICE_F_NONBLOCK vmsplice into
> named fifos? Or this is merely a test?

Yes, it does.

>
> If this is just a test, I think we need not to preserve this behavior.
>
> I did debian code search with regex "vmsplice.*SPLICE_F_NONBLOCK" and I
> found very few packages. And it seems all them use pipes, not named fifos=
.

In short, this isn't how such cases are handled in the kernel. The fix is
simple and should be applied to avoid breaking random software.

>
> (On speed: I still think that my vmsplice patches are good thing,
> despite performance regressions in CRIU.)

I already explained that this isn't just a perfomance degradation, it
actually breaks the pre-dump mechanism in CRIU. vmsplice is invoked from
our parasite code within the context of a user process, where execution
speed is critical. A heavy performance penalty completely invalidates
the pre-dump logic, making the feature useless.

Under normal circumstances, patches that cause this kind of breakage
would never be merged. However, since there are exceptions to every
rule, we should let the maintainers decide how to proceed here. In CRIU,
we have a backup plan to utilize process_vm_readv to dump process
memory. We already support this mode, but it isn't the default due to
performance concerns. If these patches are merged, it will be the
only option left for CRIU to implement pre-dumping.

However, we need to look at this case in a broader context. This is yet
another example where the change introduces a workflow breakage, meaning
there might be other workloads out there that could be broken by this
change.

At a minimum, we may need to consider a deprecation plan where vmsplice
with SPLICE_F_GIFT triggers a warning for a few releases before these
changes are applied. Alternatively, we could introduce the proposed
behavior alongside a sysctl to fall back to the old behavior and explicitly
state that this fallback path will be completely deprecated in a future ker=
nel
version.

Thanks,
Andrei
