Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A0E3C942B
	for <fuse-devel@lists.linux.dev>; Fri,  2 Oct 2026 21:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790976764; cv=pass; b=siVGwrSV9bXXwq7EJcwCd9u2bbQ2UO7NA8cmgvcjCw2EKzIg/RxBjoYodSigmXw78cqt1giYIyL8erlPoHZEVjLy7k4k7W9Xs/YaCs+AK+5AAzVXxgWG2QXHYnZPUxcFFwvrBMWcay59/OgFIAitPZw/TYdn2rabpDZpalj6Ogw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790976764; c=relaxed/simple;
	bh=Rw7p5hrp7jSiFBU+jhLnPwozbRKpQWTMWnDkk688+e4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GYdtVGI4bjPeNibkiZkSpL7pa/+95utQO0gHnmSrm/PPD2/fADI7Cfrn/e5yy73wErR8nuy4ly5tYZe5lHSiqanF6haAlWZDXaCMUQLUcPnS9lE27nRseNoULTMW2h51BV1vSdn/UWvpd/uHuS/4eOp9gnA+La1hAy0e46H+ujg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jglqjvvn; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jglqjvvn"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a605c198fdso531488a12.2
        for <fuse-devel@lists.linux.dev>; Fri, 02 Oct 2026 14:32:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790976760; cv=none;
        d=google.com; s=arc-20260327;
        b=aHGD8LTLNEpp9vaZwB9pMSOAcY7pFMwFuldTdJJMWzk+XWFDoyYqbxkQZS6l2iU9Tb
         sesA58FXUoSsCnO2mq4txsVtzAWSprUPi4aEc0BSyBDK75qkmcGkbxpE5jgGZkNQrEWA
         VUnG7T7xZq13l7SMAqagWfhF4ojiktXExkmlh6zdpixivYcSgUeHVXQSkShxBbNox4mX
         3Wch2PkavYO4aZN+fpGsxeCErhhNoZ1tdk6Qek1B2WST3C2bF79dbd4emHow8ySbToUF
         TtzKY5yZIzHOeKaruZ/r+Efp57VOG/T5kO/6YEGWIjWlrye1j/qlM1TAK9+htxOVOpaU
         0nNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AR8vK2FFVl3T+EWEuf785UBXdKYtqcyiMVEsfOCIyKA=;
        fh=o97bDLny2TCXquWepfQ4P3lcrixQU/LRaraHgEfceXg=;
        b=EfFYi3wkEM+XFO9XyIvdAi1hDEVZriFB6IZMIEfRPgQRW3j8hzAvCmWNhSp/cGio56
         wxdm17wgmWPfZyiHY1Dyx0FCAMuNDxjku05xAy/+zKPQlToO2hGcpSfXlYiQNdk5ZZId
         3mOdtuQpv6p5Ko8luvHd05y8oa8xDteZz0WqNdUGtGEVrtYFgJxKRl6SRdK2QaWRQjRg
         kbZeTMFdRDbmBKA2P5AWrq76cy/kk3EYPWtUOGxjuA2I+KzUyFkOSdOSrm96pI7EYapl
         vN5Be1nY6B1SiWS2mPcasiE1ElhfkG5ToM5QXbACv+Mjywu8uzX6CMQmMP5ixARWFv0e
         OTHw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790976760; x=1791581560; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AR8vK2FFVl3T+EWEuf785UBXdKYtqcyiMVEsfOCIyKA=;
        b=JglqjvvnJ7gFQZtLvZEodUbkevdzMEOXlj6q+Vf17Bx4IrIEffpMOrEFRR8lMEcW6h
         OD7h0BICgBNDBdncb4b1bvd/NLtOg85gq0Ugmxs8lbGB/0P1FhNHXerZu/7L3erjjFlf
         ft64dLUxN/I1cTafc6k7ku+jBkLpDigEyFm3H1N8lMF+W/67XYRa5/Sp6YnSd2lfI9G9
         m8wcYPlBawqO9wBJA3XWajyiN7lvHeJ/XyHsaNSiXPx5e1zOeIF2b+1vXO8l7IyhDvG5
         G/ckpd2NHYOcEBFa6IvplIaF9XooUZQTXwQh3NWSMFmt2ZvLxX7hQquwRUKd+9JJYAKo
         GOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790976760; x=1791581560;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AR8vK2FFVl3T+EWEuf785UBXdKYtqcyiMVEsfOCIyKA=;
        b=sJPHvBybXgBrGEzTihwfPPw/trl7FguuyJjFNVkX9ev7i8FMFDXGC/bSp1ReAgsqKs
         ug/h0UCQRc/SM44n4w9Gyw1D0HMB1qmRt4ZbkK9GccakMQ/9U7uPFytOAI+2a6VHjsgP
         UYT82dVV1wBU0HA3g5frA/JrX6GofTm5CONB8mFB2eJfHdk8DyyVVJE0RYzg03JSqTXL
         odhXfmS0KgPt943er2zCQ3E9vHotNzyhATJ0ZkSAnefJpfwh1z9EdgFNtWqe64+iydnR
         9AFUhVz+XIpfWHnxr/RhOcxly3DuEXudiRTt2KywTnuYRScIg5V2gk9OxvBIgzfIAqXO
         b3WQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOpk9ZW3jPzwPI6sjGlbPqHq7vyXwwP+7CgDf2ZKC3PKUy2Deh7lNeOD15FafHf6xhDQRFW8RXADHc@lists.linux.dev
X-Gm-Message-State: AFq9FYI5Eg26PfPqZ94U/w0qoqBQDT1RLin62eZ5oZhsXWyvzm7dzjwL
	KVQjKQ/Q7dzAf6Q9oodBvbiaGiP03GuD6DjoxH8lqi8EWc7VMa+pQvK/CXoloYqlpA/nfLjop8E
	2Ve75E9yyZIWCJdDMT80TyMSMU5nfckw=
X-Gm-Gg: AYBFou1R8xldlCm90LFfIbI0QTjtO7h90o+HPnY+CnAE4cCUNvospDkFNxKXPsXoh2S
	uuvZHjeqPyAQFYyUuDSCbqGwv/vnMu9QNLAgqCQ77dRdtfR4nVoeXsytEEcKvD292DjM08+urAl
	X4J5qbBx/+n+oFE4WSqUrpuhrSpDD1afRKtbS2dAPDqHaRQN/cmI6aBJBGQs2uCQ9rr1Tj9npHx
	PUtt8Z9YlxdgqE1TApno+k++oWgMCupXAzmX+dYLQTR5U13PcO9PmZgoRlkIpFBvFWlzTTIhYT+
	BkqR84T/ZcK6Ol91fd4qnII7RBAiy5whGje5v8wplX7XrrZtWRLTXU0=
X-Received: by 2002:a05:6402:46d1:b0:6ac:70f2:9205 with SMTP id
 4fb4d7f45d1cf-6af9e386d01mr2467536a12.43.1790976760359; Fri, 02 Oct 2026
 14:32:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKLmikMhOYpGEw6uCqX_Bm0JPEg-4FhdJMNa9+tgtw3-Kf+eZg@mail.gmail.com>
 <e75cf549-07a6-4095-bbf8-8caff7a3338b@bsbernd.com>
In-Reply-To: <e75cf549-07a6-4095-bbf8-8caff7a3338b@bsbernd.com>
From: Mitar <mmitar@gmail.com>
Date: Fri, 2 Oct 2026 23:32:29 +0200
X-Gm-Features: AclHuK_SMxUC5ptg7waR4khxz9du87Zel1clvodF34USzNqE3fzoU6-rh2TvexA
Message-ID: <CAKLmikN9Aod9Va=FsqkRmF20=69sdgdDOoV_bUuGh6wTykVcBQ@mail.gmail.com>
Subject: Re: fuse: HANDLE_KILLPRIV_V2 does not kill suid/sgid on fallocate()
 and copy_file_range()
To: Bernd Schubert <bernd@bsbernd.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

Awesome! I looked at the patch and this is all probably above my head,
but I think the patch should also include some protocol text
describing the flag-only SETATTR, because this is now a new behavior,
no? And probably we should also do a minor version bump so servers can
tell that they can rely on this behavior and decide to request
CAP_HANDLE_KILLPRIV_V2. For example, in our case, we do not request
CAP_HANDLE_KILLPRIV_V2 now because we are aware of this issue with
fallocate() and
copy_file_range().


Mitar

On Thu, Oct 1, 2026 at 12:57=E2=80=AFAM Bernd Schubert <bernd@bsbernd.com> =
wrote:
>
>
>
> On 9/30/26 23:45, Mitar wrote:
> > Hi!
> >
> > While adding FUSE_HANDLE_KILLPRIV_V2 support to a go-fuse based
> > server, I noticed that with it negotiated, fallocate() and
> > copy_file_range() by a caller without CAP_FSETID no longer clear the
> > setuid and setgid bits of the file they modify, and that the server
> > has no way to learn that it should clear them itself.
> >
> > The kernel makes the decision, but drops it on the way.
> > fuse_file_fallocate() and __fuse_copy_file_range() both call
> > file_modified() before sending the request, which ends in
> > fuse_setattr() with ATTR_KILL_SUID and ATTR_KILL_SGID. Since commit
> > 8981bdfda744 ("fuse: don't send ATTR_MODE to kill suid/sgid for
> > handle_killpriv_v2"), fuse_setattr() drops those when
> > fc->handle_killpriv_v2 is set, expecting the server to kill the bits
> > when the WRITE which follows arrives. But no WRITE follows
> > FUSE_FALLOCATE or FUSE_COPY_FILE_RANGE, and neither carries such a
> > flag. All the server sees is an empty SETATTR before the request,
> > which it cannot tell apart from the one it gets when only
> > ATTR_KILL_PRIV was asked for.
> >
> > For "fallocate -l 8192 f" run by an unprivileged user, on a file with
> > mode 06777 which they may write to, the server receives:
> >
> >   GETXATTR  "security.capability" -> ENODATA
> >   SETATTR   valid=3D0
> >   FALLOCATE offset=3D0 length=3D8192 mode=3D0
> >
> > and the file keeps mode 06777. Without FUSE_HANDLE_KILLPRIV_V2, the
> > same command clears both bits, since fuse_setattr() then turns the
> > request into a SETATTR of the mode. I verified the fallocate() case.
> > The copy_file_range() case is from reading the code, as the server I
> > tested does not implement FUSE_COPY_FILE_RANGE.
> >
> > This matters beyond the mode looking wrong: fallocate() with
> > FALLOC_FL_ZERO_RANGE or FALLOC_FL_PUNCH_HOLE, and copy_file_range()
> > even more so, change what the file holds. So somebody who may write to
> > a setuid file can replace its contents and keep the setuid bit, which
> > is what killing the bits is there to prevent.
> >
> > It looks like an interaction between changes rather than a choice.
> > Commit fe0da9c09b2d ("fuse: copy_file_range needs to strip setuid bits
> > and update timestamps") made copy_file_range() kill the bits in 2019,
> > which stopped working on FUSE_HANDLE_KILLPRIV_V2 connections with
> > 8981bdfda744 in 2020. Commit 4a6f278d4827 ("fuse: add file_modified()
> > to fallocate") added the same to fallocate() in 2022, which takes
> > effect only without FUSE_HANDLE_KILLPRIV_V2. As far as I can tell from
> > its source, virtiofsd with --killpriv-v2 has the same gap: it drops
> > CAP_FSETID for write, open and setattr when asked to, and calls
> > fallocate() and copy_file_range() as they are.
> >
> > I think we should pass the decision with the request, as for WRITE and
> > OPEN. For FUSE_FALLOCATE, a new FUSE_FALLOCATE_KILL_SUIDGID could go
> > into the currently unused fuse_fallocate_in.padding. For
> > FUSE_COPY_FILE_RANGE, it would need a new field, or a bit in
> > fuse_copy_file_range_in.flags behind a new INIT flag: servers pass
> > .flags on to copy_file_range(2) as it is (virtiofsd does), which fails
> > with EINVAL on any bit, so a new bit there cannot be sent to a server
> > which did not ask for it.
> >
> > What do you think?
> >
>
> I had actually noticed this with recent test additions in libfuse and
> had to add workarounds (on the day exactly one month ago).
> Unfortunately had been too busy to post the kernel patch yet.
>
> libfuse commits
> daa6cb7f6996 =E2=80=94 "test: check the KILLPRIV_V2 kill-suidgid flags re=
ach the filesystem"
>
> and
>
> 60ab8c0c35de ("test: check a write through passthrough_hp clears suid/sgi=
d")
>
> When testing the latter commit I had noticed the issue.
>
> Could you try the attached patch? Right now totally untested,
> I can test and send it out earliest during the weekend.
>
>
> Thanks,
> Bernd
>


--=20
https://mitar.tnode.com/
https://noc.social/@mitar
https://bsky.app/profile/mitar.bsky.social
