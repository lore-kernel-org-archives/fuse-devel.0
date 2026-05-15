Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB132487BE
	for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 20:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778876275; cv=pass; b=LFBFfLrlDDGCLgnUUrfxZq7lxbGd47g1496O/n59Oj0yf4JZGYWNLemot6fiQUb7vTdaIAkcnEA10lZopnW8rCvLrYXXI4c0KqOBOKIyZ1Qr3Gkl0GzOwD2yrrqTmqcmuxr8Hj2xYW3LqVnLHPL6VVefFZ3PPDNkSUtJM1vIwAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778876275; c=relaxed/simple;
	bh=2DXyIq90HL8JoEt+riYlVe6ELtsC4TBaPi6OOxXk5MY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XzQztrZ47xEyB8j4iPsy4gke+dZOJhJrOUkVIv+9ixllzAel1N/4mHVM8VXI9UkZM9RDdDHwxRZ3aYJqRYLWWc2JdmEtN37gY79U2eAldv0XW3gOayC6tEBDo3vWcS3pUMWG/zrJwqT4MyLd8y1fFvbsaIfh7VIC70YCfLGBqzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROTCSHBJ; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROTCSHBJ"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-67c1e0229acso435940a12.1
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 13:17:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778876272; cv=none;
        d=google.com; s=arc-20240605;
        b=ebAiZOpxOvd47Rb8gFLllhtf51ULAgqmRiOL3AY7h2Uv/KTWl4WJMUjv2/EeIIfEwP
         VfHnKeXpsCNhCoFRlsGW+5m1CCptyEgz9RIhNSRqlD755khF6uV3OSbq8RxGlEqI/HMA
         EmnNF6VKx80A9xMuN0QsXmc+PZcklQJ0BtMXwoTOSsx5plKnuyEuaSNOC9G5VbuWyRmZ
         GWAagLeGi9mFynTIqgKRKfMaU48Wwh2rdV1uTa8w23q4g9PIG6lQ90F2neRwGzEyp/HX
         OF/kwIQXiuKmUAjt87Tye+AXVnOcSVxS2ElGq3CK1vZhxaYYfSNt187WLl0LHB2Um/4I
         dU5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2DXyIq90HL8JoEt+riYlVe6ELtsC4TBaPi6OOxXk5MY=;
        fh=cJldv8FiUDn4TD5uiddr1Z4ZkMZf7HtbcVvfB+l0l7s=;
        b=X8jHdvS/PU6PttizZEzX3dOEAUSEXZrKsYJKQAkflrGTPQ0dXgKRNNqRPCKoUZfUgk
         4SbLkA3cL3USbJY83lAbPvwi1BAhA+Zt6cgYqSm00Hmw9KlRda4I3QShUu8T4B0ep2Z9
         XttFQ0D/Si6Kta19wUpJCdbP90r2boE7uFoQKFWBHIf5BE7aEjH6FDxL46aHuh57erK5
         kiXPs9dLAC7NoIq5VfB75+8GeyJ7Ypa+fy6EP/yzZdpWUzBiM6MxJVEJPZO1P7Zr18JB
         JDpfFWmRS1kZiSIZQmxc+WBKt6RiKlIQrgWGOgl0zQvqJkmtjiL5V2rocTRAYwrD/xef
         Ivow==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778876272; x=1779481072; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DXyIq90HL8JoEt+riYlVe6ELtsC4TBaPi6OOxXk5MY=;
        b=ROTCSHBJNHE5XjN5+8JWzbomb8vu1KBCprM2rmruGLr6TePwm1CdPlr5YuXOmFR+pR
         BWS1f517TOVd0hadIfdh3frkMGQ8s6Gu8EgTSLI6Y1K/HccnG9Cj73ZXr6ht3j2+ucFe
         D/zzqAdKSJAd3sLZNQtlz0f+vU39loGa8AsYWLeD0jkW/6Q3QrkHe21m8VWZKBH74YD5
         LMZ53hSCMBa6v7qLq41hFxXm9HE+0LyG7LSbYtR7zJ6W/Ca9sAX9l1rAC0W6vNQ90eia
         kDW+e6X3TlAwR947jf86byJRou+zsnD7MxxqaV9rMDCXcMTJOsxpM+fjIcmqP19hFQf/
         iznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778876272; x=1779481072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2DXyIq90HL8JoEt+riYlVe6ELtsC4TBaPi6OOxXk5MY=;
        b=NwjbEUj7fzVRYOIM7VssObO8oO+AXobDxg4a1VpptuSkZzo2afMl2vNJEs0PBPcJlq
         ZfIgcT7Ur21BzvjCfsp4FVkiTtJ3fgCoVwMTtZcKn2pre9M0FAD82rDmMij+X7RCBo1S
         kTMLqlpAPwb+Qz+7gYNFTvqkKjeaiGp9fZUQ7hC78Wk4qpHgCEsfPhuxH4MDCWCMAuOt
         EFqRuUxyyrST54axWxopyB3yHv6bk8QyB22Xsl5xl3MS5k4WwF22Q7LtcyCt7PDnx8Wa
         +aGhu1oD4NMaLeWRrYgHJ7vUDqGIKeWpyUZqobUbOeq/x1L6eewNJYL4sOhHiYaDIu4r
         OE1Q==
X-Forwarded-Encrypted: i=1; AFNElJ9oCUJsHQiqPndWnvZTZzd8c+93HUry7qjmspEiwyuIb9gosv/Bv8hJFQaK0Dmnzp+5nMFQCy5vP8qZ@lists.linux.dev
X-Gm-Message-State: AOJu0YwQo1j9qVa55HrmgN2b/wkAi4AhWASiFdZBSk1R3H5xs/GyqcZD
	D6tINh3fsj9DqXeJqr4SpG3B8do3+AORszF4Fw2DVkl0Y70K0S4IaxCUIDnykebG2kkPDyJ8nsS
	fy9Ylx+ugl16oPp4r5ucc/+gBb3HQCNU=
X-Gm-Gg: Acq92OHtsGqqLrQ64avVBB8xOTvCTKhJAGJd5LbutLpI2WBu/Nme/bZU5DZlzriPGu4
	W1pQjgo5lfg6yeMf9JvJHDdScx84xpANSXU+BQ0VFcMg0w2I+n3UNmQ5UsSYdlM16nnQtM/sIol
	bGBVZvzgZNmqtEwCaAdv5QFlezWf4g6ChRlRrWng9BmAuRd9xufXL6A/k+lEgttDWlXgN+ipQ1H
	+2K9B14XTV80Pqd5W3FxOAkQoLHRn3avF+WxJoBaedK3csqUDhvhdSENYhbUSavNxKIe6UFcHd2
	q5FHJBbP6N+Bkvt6CjyXriaFGqpP95zNDEJkX5XulQ==
X-Received: by 2002:a05:6402:a553:20b0:671:ab62:765b with SMTP id
 4fb4d7f45d1cf-683bd78c127mr2156886a12.20.1778876272200; Fri, 15 May 2026
 13:17:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260429102058.1362965-1-mszeredi@redhat.com> <CAJnrk1Z_JWtuA3UjucF9=YH63AH_-J_0hzr9jbY99Hx3O8YrAw@mail.gmail.com>
 <CAJfpegspraqMp1Z3mi_csiw6haawZPa4zWheSUN7MhBy47aYKQ@mail.gmail.com>
 <CAOQ4uxgV4_Pet0w3f+Sq4kLkvgKM6FyJwZ4AQsnvctC3w=dP6g@mail.gmail.com>
 <CAJnrk1ZvB-R3Szn-VxOZvPRgX_dXwMLouBphnT9_URCE8SxTvQ@mail.gmail.com>
 <CAOQ4uxidwSn69A08Urue7S7n8wrGQcyGuvRL387pD+rpSFP-Ew@mail.gmail.com> <CAJnrk1ZJ1pVWn21HZATRes55RJD0F0+6SHbq-8FojPutQTiW6Q@mail.gmail.com>
In-Reply-To: <CAJnrk1ZJ1pVWn21HZATRes55RJD0F0+6SHbq-8FojPutQTiW6Q@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 15 May 2026 22:17:40 +0200
X-Gm-Features: AVHnY4I2LLv-HfpohghtdvVbqkqJkNUSgOrPr2eYGxJXSVJpcLIcLIkS7YOTO2s
Message-ID: <CAOQ4uxgDGuFq=Szw8G1BMuhuBhZ029kf+FrVq6y2Oq+gaQ78sA@mail.gmail.com>
Subject: Re: [PATCH] fuse: add fusex filesystem
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 1:24=E2=80=AFAM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
...
> > Cool. Let's get this rolling.
> > I need to get my test setup back in shape.
>
> What is the test setup you are using? fstests with passthrough_hp or

Yes. *was* using while I developed the passthrough patches.
Didn't run it for a while.

> are there other tests in addition to that? If there's other tests
> you'd like me to run besides fstests, please let me know and I'd be
> happy to do that.

Nothing beyond the libfuse test_passthrough_hp sanity test and
fstests with passthough_hp.

>
> When I ran fstests yesterday with passthrough_hp, I saw generic 683,
> 684, and 685 (dropping suid/sgid on fallocate, fpunch, and fzero)
> start passing, but beyond that I didn't see any improvements (or
> regressions).

That's the last report I have on record:
https://lore.kernel.org/linux-fsdevel/CAOQ4uxh=3DcLySge6htd+DnJrqAKF=3DC_oJ=
YfVrbpvQGik0wR-+iw@mail.gmail.com/

It speaks of some tests that are
"failing because of missing mtime/atime/ctime updates" and of
"failure to strip suid/sgid bits in some cases"

I had imagined that the passthrough of GETATTR would fix some of those
failing tests and to some extent, this is in line with your report.

Attribute cache and passthrough is an unfinished business.
If we could force passthrough of GETATTR when inode is
in passthrough iomode, I wouldn't mind.

Thanks,
Amir.
