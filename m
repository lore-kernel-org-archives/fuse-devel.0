Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794038327;
	b=QhYBQahlwDk5OAdT9fkg4h1PoIEL7eAlNL6k6Pmtpu64qw9XEYevqiNws3Cgt2v1aIwy
	 8WeBpKT0Wercp3Fw2ua3eMHzwqxXf59pQc7NctMs3xAk3eKWR6MVAAIAHn6J8WKbVBZb/
	 V1bsopXp8fQjwKTmxDICD0TiySKpno8rBxkNxPZKnWppQlcmAYx6Kx1blT6jEC2V7fA1E
	 x47uqVUEOHnfEnKYPjGlHlQZ3YJNaK6IJPBpapV6g0paU1Zeec9XGMZ0wB1wB6V6EI0lT
	 /RCRSYY2NmmkHDgLHXIhRvR8E5ZXGCoIW2d7rNATF8b8Pqs0pWfUDnXbwbRoRTt499Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794038327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KVUTn3NefB2pYcpRgIbKLSS1BYXCOeKVEt1Rx8hpLqE=;
	b=E7xkOfJDVu7CLBMnT6z8cZ3i/EIAab1THjevMu5TqJVsyQKYxrtYy9qxktkV9kcPVwn8
	 9OSzJocfYEy+zo4Mduc4R3pXY/jlQFFFRQusA9R5m/7WDNKgXrASg/KJXNNCBWvrDy2zY
	 RdRnF0hQ+fBtA8z+Ixigb0tVYB7ZxCjjsrooLNhj673Qg6R1QjvDEj8M/N96uAY3IuiZD
	 pVtRRZfQDnTqF8g+bnKoAEEJXiB/dALN4gP3OBNJm5UceOQvkP0gaAL2rKYmTXexwlyv6
	 9C9EIz2CClA3vq5dGDqhQcAVyOZ9/cqZgzrYFS2kM5L68Cp2CQTun+GQTFzs0IV0cAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HQ0oaO38;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70156606A32C
	for <fuse-devel@lists.linux.dev>; Sat,  7 Nov 2026 07:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70156606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HQ0oaO38
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c445c95d553so178378266b.1
        for <fuse-devel@lists.linux.dev>; Fri, 06 Nov 2026 23:58:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794038325; cv=none;
        d=google.com; s=arc-20260327;
        b=MmUw4rEeXRkfGDsgVp1Yt6kQlONJD9JPoKOPucmVEHTdWubA+QimSFXkXs9kSv2gYl
         PtzgpOhUnY19lv+HvKrkpKUhpjK9DceLHIaVi7QpLaLiuZx7R3QtKUa2qvk4ocrDud0c
         dtnUiIbUPmIwpzJ17G+cL77WduyKbNU8pSn0GycrA5UllE3huR+gdPo2svq4X1/jXMxr
         yBYKhooPPWCVH/XSVqizC4zSYjvI+Ip3gVV36xwOjOPd+Hct9XiCwaqkboaVS/8P6mz6
         f3xT93cSAgIVcKZ+5NRPUdfBIStCx2AA6inEZ3zDgsS8owz5JNuHe0uCQDtjJSm7WLQR
         jsGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KVUTn3NefB2pYcpRgIbKLSS1BYXCOeKVEt1Rx8hpLqE=;
        fh=5jWtRONHHwAov/zCrZnJc5hFtwuskW7NPRXEeC4kc9s=;
        b=U89A+lHilLwBVrkR/tvv7KfG35PYgQTGERPQlDaY4VIFXXD7IW79daAOEieXLvk7Gc
         RvTyA+TfnWWY99nYxETYJYYPv578Lo8GAxuqC/peKc79CqVdXSFHw1L47PSq9bl/luc8
         v8lbYaGGe8i5znqZIjFBWQHC+glTKe96GYWyQ0vmMnpmpkKC+ph/l59LM2BxTMgGVHcr
         QTkgxBkEvBfNDCsVP8r1M9nexkAbLPD0LVtKGL0sw798bJhkd9Ej8IG1R0AlEPnpreBz
         hjHm0YAwT7Q7w/cmPqU3VM2AbkoGoEgZ4I9+ifPYSf36RhjeMuTd9mNHdNuxoapRbFWs
         8X8g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794038325; x=1794643125; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KVUTn3NefB2pYcpRgIbKLSS1BYXCOeKVEt1Rx8hpLqE=;
        b=HQ0oaO388/g+ItrX4FYjZFj3JzcSS0dhuuIjaWjIQAvoCNPN72Sr59i2JcBQ5joW6Q
         rD8a+bGdEtqm7ipfLJesFBTO1uS7998uTwMXGfNKmB4ZSG3UZepqI29sHHLjx3MADpg/
         RIdq9UuPX3p1qZ/A6u5YZ1VcvbbGGqTVQq/SF7Ex0q5r/fP1irD5uhZ3NTYPc6i50EBc
         9kCHwqmtdXI9vNFW23W7bRwSrSxxFYkLl+zqhTeemnDBlyS1y0FmD6jsDgI+/OtGwa3h
         EcGv9E5pZO72wwv+MDVmnkZNGPi1Fy3zMp9+oVbFSb7yhqxHy6jK1A4dUFk7+mEQitnw
         VAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794038325; x=1794643125;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KVUTn3NefB2pYcpRgIbKLSS1BYXCOeKVEt1Rx8hpLqE=;
        b=Dximk919CcG/zvVNfcuI3Q2y6S9OOFBZGWGbrHVzd+3qM5CpnNL0vXacWINmj40Q7f
         x+qOlaamMoBPZ1o9mUSI8Fl+8Br3e27GrksBNQlzBAp4FbiV/JPtwfuThtRKOFUPREy3
         RWbYv2VxTEZKeTDitlytRjXPriyL9P9GdDTSrpGZL06evd2/tyzOVa+f7EK+tFYA49oU
         Ck2HFZsoyP2NbUC3MdMJosPqucxQsRsNPmx6OvGrXmtwbvdYEex0f/yxbAk1UyhkW1Es
         dX+hiWs9WKVXNQwHOJFSHIE880zI0yxcd/6xjafypTn+XqJ0wrhMOHjHnXR6F/ro15gu
         tndg==
X-Forwarded-Encrypted: i=1; AL+hErFffs5hB4FDF6EQ5dfHSHEt0S9md8C5E2MSPcOnZ8fqpY557e+/RHdGe6WUbF0AW1QX29/3BQk+S+mD@lists.linux.dev
X-Gm-Message-State: APuU4Z/MgOGQidt9/oY5jsXGLynF36W0G6LrhB+3k604iEDH0I/EfdKM
	QpgpHDd7cw52prvWgCKIRK1zUBq/qsDpAzScRZr461F4qqB5a2r02HCZdBl0Q9zqHiuV4uMZH15
	vpFMdafhNJr2ipjZE4zT/6cF91a8ZUXk=
X-Gm-Gg: AYBFou2qzFwAB9bWyXJmPC55UwE+8l/sWO/Gwb9riIfJ3rSCOk7mhbmKwM6QJfBNm6z
	yfotSh8N1W01MWjC3uA89Dl5XMeeUhQZTFsE86vjXSnmauFqcs+xtd5YKd8YvZvDs1254d5Yx6Q
	qlqGNXAAw5PGeKts4IYgJteIfWdS3kPj0XlwsFIzPtPWP8vkpfomkKsHURzqvpWJWVJHC8pz+LJ
	xYnAEo+s4kaVLK92BIN7eqsEhwt78IVu0qeOBHKCrpCxgNbvQAsr0avPTE1rabwjFc2urIzhoRr
	nJN70Stmt7OTHoV67+iLt/zt1R+27o2BA9NDw9XlnU/PJRm2CHRBYCsC6cWRW3FbrPNdNrZnoWy
	sXTR1SM5/ndcGvg/mSk6nd3Fx42EOR7GX3o9a
X-Received: by 2002:a17:907:c0a:b0:c3f:7ab8:bef1 with SMTP id
 a640c23a62f3a-c4d34c5d8e4mr392839966b.34.1794038325410; Fri, 06 Nov 2026
 23:58:45 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAKLmikMhOYpGEw6uCqX_Bm0JPEg-4FhdJMNa9+tgtw3-Kf+eZg@mail.gmail.com>
 <e75cf549-07a6-4095-bbf8-8caff7a3338b@bsbernd.com> <CAKLmikN9Aod9Va=FsqkRmF20=69sdgdDOoV_bUuGh6wTykVcBQ@mail.gmail.com>
In-Reply-To: <CAKLmikN9Aod9Va=FsqkRmF20=69sdgdDOoV_bUuGh6wTykVcBQ@mail.gmail.com>
From: Mitar <mmitar@gmail.com>
Date: Sat, 7 Nov 2026 08:58:33 +0100
X-Gm-Features: AclHuK8tSl2eC8RfsY2HLkZzpD_9Mv8udwoMRcvajXKX7YtJEXcVLoT4j91is5E
Message-ID: <CAKLmikO5y916zgeX_UFqfGQ+BUmNC6uvHFR_bsizeTJu4AwxcQ@mail.gmail.com>
Subject: Re: fuse: HANDLE_KILLPRIV_V2 does not kill suid/sgid on fallocate()
 and copy_file_range()
To: Bernd Schubert <bernd@bsbernd.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

Not sure what the process is here, but how to get this patch further?


Mitar

On Fri, Oct 2, 2026 at 11:32=E2=80=AFPM Mitar <mmitar@gmail.com> wrote:
>
> Hi!
>
> Awesome! I looked at the patch and this is all probably above my head,
> but I think the patch should also include some protocol text
> describing the flag-only SETATTR, because this is now a new behavior,
> no? And probably we should also do a minor version bump so servers can
> tell that they can rely on this behavior and decide to request
> CAP_HANDLE_KILLPRIV_V2. For example, in our case, we do not request
> CAP_HANDLE_KILLPRIV_V2 now because we are aware of this issue with
> fallocate() and
> copy_file_range().
>
>
> Mitar
>
> On Thu, Oct 1, 2026 at 12:57=E2=80=AFAM Bernd Schubert <bernd@bsbernd.com=
> wrote:
> >
> >
> >
> > On 9/30/26 23:45, Mitar wrote:
> > > Hi!
> > >
> > > While adding FUSE_HANDLE_KILLPRIV_V2 support to a go-fuse based
> > > server, I noticed that with it negotiated, fallocate() and
> > > copy_file_range() by a caller without CAP_FSETID no longer clear the
> > > setuid and setgid bits of the file they modify, and that the server
> > > has no way to learn that it should clear them itself.
> > >
> > > The kernel makes the decision, but drops it on the way.
> > > fuse_file_fallocate() and __fuse_copy_file_range() both call
> > > file_modified() before sending the request, which ends in
> > > fuse_setattr() with ATTR_KILL_SUID and ATTR_KILL_SGID. Since commit
> > > 8981bdfda744 ("fuse: don't send ATTR_MODE to kill suid/sgid for
> > > handle_killpriv_v2"), fuse_setattr() drops those when
> > > fc->handle_killpriv_v2 is set, expecting the server to kill the bits
> > > when the WRITE which follows arrives. But no WRITE follows
> > > FUSE_FALLOCATE or FUSE_COPY_FILE_RANGE, and neither carries such a
> > > flag. All the server sees is an empty SETATTR before the request,
> > > which it cannot tell apart from the one it gets when only
> > > ATTR_KILL_PRIV was asked for.
> > >
> > > For "fallocate -l 8192 f" run by an unprivileged user, on a file with
> > > mode 06777 which they may write to, the server receives:
> > >
> > >   GETXATTR  "security.capability" -> ENODATA
> > >   SETATTR   valid=3D0
> > >   FALLOCATE offset=3D0 length=3D8192 mode=3D0
> > >
> > > and the file keeps mode 06777. Without FUSE_HANDLE_KILLPRIV_V2, the
> > > same command clears both bits, since fuse_setattr() then turns the
> > > request into a SETATTR of the mode. I verified the fallocate() case.
> > > The copy_file_range() case is from reading the code, as the server I
> > > tested does not implement FUSE_COPY_FILE_RANGE.
> > >
> > > This matters beyond the mode looking wrong: fallocate() with
> > > FALLOC_FL_ZERO_RANGE or FALLOC_FL_PUNCH_HOLE, and copy_file_range()
> > > even more so, change what the file holds. So somebody who may write t=
o
> > > a setuid file can replace its contents and keep the setuid bit, which
> > > is what killing the bits is there to prevent.
> > >
> > > It looks like an interaction between changes rather than a choice.
> > > Commit fe0da9c09b2d ("fuse: copy_file_range needs to strip setuid bit=
s
> > > and update timestamps") made copy_file_range() kill the bits in 2019,
> > > which stopped working on FUSE_HANDLE_KILLPRIV_V2 connections with
> > > 8981bdfda744 in 2020. Commit 4a6f278d4827 ("fuse: add file_modified()
> > > to fallocate") added the same to fallocate() in 2022, which takes
> > > effect only without FUSE_HANDLE_KILLPRIV_V2. As far as I can tell fro=
m
> > > its source, virtiofsd with --killpriv-v2 has the same gap: it drops
> > > CAP_FSETID for write, open and setattr when asked to, and calls
> > > fallocate() and copy_file_range() as they are.
> > >
> > > I think we should pass the decision with the request, as for WRITE an=
d
> > > OPEN. For FUSE_FALLOCATE, a new FUSE_FALLOCATE_KILL_SUIDGID could go
> > > into the currently unused fuse_fallocate_in.padding. For
> > > FUSE_COPY_FILE_RANGE, it would need a new field, or a bit in
> > > fuse_copy_file_range_in.flags behind a new INIT flag: servers pass
> > > .flags on to copy_file_range(2) as it is (virtiofsd does), which fail=
s
> > > with EINVAL on any bit, so a new bit there cannot be sent to a server
> > > which did not ask for it.
> > >
> > > What do you think?
> > >
> >
> > I had actually noticed this with recent test additions in libfuse and
> > had to add workarounds (on the day exactly one month ago).
> > Unfortunately had been too busy to post the kernel patch yet.
> >
> > libfuse commits
> > daa6cb7f6996 =E2=80=94 "test: check the KILLPRIV_V2 kill-suidgid flags =
reach the filesystem"
> >
> > and
> >
> > 60ab8c0c35de ("test: check a write through passthrough_hp clears suid/s=
gid")
> >
> > When testing the latter commit I had noticed the issue.
> >
> > Could you try the attached patch? Right now totally untested,
> > I can test and send it out earliest during the weekend.
> >
> >
> > Thanks,
> > Bernd
> >
>
>
> --
> https://mitar.tnode.com/
> https://noc.social/@mitar
> https://bsky.app/profile/mitar.bsky.social



--=20
https://mitar.tnode.com/
https://noc.social/@mitar
https://bsky.app/profile/mitar.bsky.social
