Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50ECE384CDF
	for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 19:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778613766; cv=pass; b=GmGv4idstLbKsChoeRm7EhepkG5Mg8wCwUrD3uTrMUDnmGS3WDnNlcCUbGO6mBI1zMS8dkHfS+1fTWcuYwkwWjUd+HgnqfZP4qAGrdpjmk6Cx+YAyjME4Wd/KgRLUJEv8Y5l+IL9TuEIhmHhrB4KL3Aw/f+eJVfxQvwoSxsjJVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778613766; c=relaxed/simple;
	bh=VtrKsBqRgrQg5Z05GDQZPthjO+/OzETxg7+nkm/RnNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BBQlKxwgw3HGhGIx75H9J66zfx4+jjqqG9nxjIY9DomlC1FvBpT3Pe+xzMYa3KlMRyKPQTD5UCrpp2IGKMXLls9Q4lLjmhxFSTaxhzZgAdwwkAp2kjsiRxiNFGd7OW8i06m5zvseROtlawYCrHFZbJf4s4ETpiHOyGDY74QZrEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3109U3L; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3109U3L"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-444826c16ffso5129947f8f.1
        for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 12:22:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778613763; cv=none;
        d=google.com; s=arc-20240605;
        b=i1ER0ymWUqaUoqMX0pUGSiIZCA2udwRO8PtMSAQUCHtpz8NLpd8nCmF8hP/5v7XlGx
         7qm3gtf82HFq2/HKtv7ug3c4Qk+kRSlk14fR2Tkxj+MJwY0jrt/TFt5jpNLJK3vVq3L6
         7MEJ97Kjn9/xoG7g1USyOpOz5y3BKsNWIbgsao2A1oVSk8WrOiDtBCiYYG4uTBh49yI4
         RXxqOGlntWJ9GB39CTsSQRrXmssBsC6sGfOpcPTz6zrk56CE8HaZz7tLsQaAmlWWKem1
         t+482FhV1Bi0BuZUWYkGNXjdADviH9XCydRnTveZtGcIQmXc1XZfxZ5imJAEqXqBkruU
         IGyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KrksB7YyuGcL8UdLAV/lyg74rIhz+tVDke7Rs32Izbw=;
        fh=5aOtHcXLz7jK+gCUV3UpgqlWcE5OOR2oiEt2onENZCQ=;
        b=TQbNYR9H/77cpsUM3Q79qUYdBEY+9fYQI44M39KtT0d1etPxsURw1fPc9grptCNlaq
         m4diGQiF9GdywgDf5590BUVFPgZG/56WUGC+V3ibewMPFERdsV9P0NXv7CHmuL5Kc8ld
         aOUy9lfMrv1JFPNbElR82oqxMgjmkX9Yc5+iMgLY6+xaXRmYEq3/9uJBrcnYM11CrqGV
         /0Ajiyv/n2FwIfI/BF9VHdUfNt7sLkZ20913K5p7q+numLyGaARMukZN/7MADGnLxwAN
         FoYXOXs2y2pfGSr7Brma1Sbz4XdR4o68ph0dWb+9ID7R10T/A+sP+brb7XqJvIULgT+6
         E1Ew==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778613763; x=1779218563; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KrksB7YyuGcL8UdLAV/lyg74rIhz+tVDke7Rs32Izbw=;
        b=h3109U3Lo+uPQfeNlQKuMiw5bTIZl03dyrX/wB+3NNIYCYpTEmeiL8364+7pEkEw+6
         4bg0jHtR3bqlgfGi4Mqol+3jkpUg9BONv7b/Tu2GDrr7ULfmdsbRmoMWL5lhrdcGmfbI
         Vt4ZDnTwntGp7EOJ/ihIyOy/y5lQm1p6R0hUOaXvzlcd8ak/2A8VEkxp5AoOyM+DEfv5
         1wTF/CfFUnFHZFjJYw4l8XeCUrJYFmr+mOCOPfn4QSxunsMnIgEHkplDlpUK+MElf/Mg
         VLDUH8FfAx8uciVtcleWY8LNtGvZus2tR+RirVg7ugh7BtrreXA0F3yFhC34vxxQHm9t
         oBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778613763; x=1779218563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KrksB7YyuGcL8UdLAV/lyg74rIhz+tVDke7Rs32Izbw=;
        b=ZmEjZYwVxeCf6ENlw9wWZRWpL39quaXYnTdCxKjowkEyCedlyvOVMuaVlWiDpcFAP8
         T1QPv7Yx41qIJ0ajfpEa/rHmk+KmwfmBs6EnG+oxd36dt7r6a1c6cCnnzU+CWect4/lm
         3fYc4IWyYeg9ePE2NJiTgwx+RHeUgqgZ6uCT+qILbV+r/uRMZbakyLeZpEmJ0hM7NHV6
         gfzx1ZiiEBPMqXK69wOsB76uzCmxZ2YdAiiZ3MOQ/yIXZz3jxDq+DfDgOikqYc4YWTaK
         mBDzGZvgX/FgnXZuwAQGWCx4Cw/TGzzTeR/0YXwZbxnZmG34POd6VuN1+yjSQgVKkX8r
         G6oA==
X-Forwarded-Encrypted: i=1; AFNElJ+Qx+sshO4RoAM+88jDJ/Jaa0gda/P9Dy3tQesq0Q99BpC/5trlkJfrfN1HU+hCyTDPNNDQGrIPFp1M@lists.linux.dev
X-Gm-Message-State: AOJu0YwtaPUrhwf/al10acNC1rbrQ9xkuP2kwJk+VMZFFINs5ZPws6sD
	redoDfm7/SlP64MTztlvio7xCc6aLCjgKsLnKXLf5IhjKyNMBF6Tho69Ll7NUbTESxqF1NR7JyJ
	DnyXItkXYMz0VZ8mRdZmdD2Ba/e0uUrY=
X-Gm-Gg: Acq92OHR/mdzL0xKfAkxZYDxuM2QhHaYy3ElxzU606H8elvek55+ak12X2Wc6bQe4pJ
	cEs4QqKohwW+8iq+9a5lIhSLz4doRoJzFRznupqqs5KKQ2Aj9Hfiuie0vu+4KZW4G0MZMy/oc6e
	5Xh5vH0baG6v57C1gI+EOxidu+ncc9p4/aKrhovtOIjnFOSSDO9irgxbDPH3KMNYLeZ5mBlgVmu
	cv6TamsSUpKmeUIgjc7QP6TJhBgnq+XnbA6Fpau/xTldnApn6mrePIEgZqC74zm4AGSTyKjbUcA
	4Kwfxw==
X-Received: by 2002:a05:6000:2289:b0:43f:e99a:ff91 with SMTP id
 ffacd0b85a97d-45c5859f1famr171276f8f.4.1778613762530; Tue, 12 May 2026
 12:22:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260429102058.1362965-1-mszeredi@redhat.com> <CAJnrk1Z_JWtuA3UjucF9=YH63AH_-J_0hzr9jbY99Hx3O8YrAw@mail.gmail.com>
 <CAJfpegspraqMp1Z3mi_csiw6haawZPa4zWheSUN7MhBy47aYKQ@mail.gmail.com> <CAOQ4uxgV4_Pet0w3f+Sq4kLkvgKM6FyJwZ4AQsnvctC3w=dP6g@mail.gmail.com>
In-Reply-To: <CAOQ4uxgV4_Pet0w3f+Sq4kLkvgKM6FyJwZ4AQsnvctC3w=dP6g@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 12 May 2026 12:22:30 -0700
X-Gm-Features: AVHnY4I0Y3BrmLWelt6oDqQj0GcnCVMfHGqh6xLzugs-tH2pa1VNyILa-YgX3n0
Message-ID: <CAJnrk1ZvB-R3Szn-VxOZvPRgX_dXwMLouBphnT9_URCE8SxTvQ@mail.gmail.com>
Subject: Re: [PATCH] fuse: add fusex filesystem
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 6:22=E2=80=AFAM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Tue, May 12, 2026 at 11:31=E2=80=AFAM Miklos Szeredi <miklos@szeredi.h=
u> wrote:
> >
> > > * in passthrough: backing_fd passed at lookup/creation time only (not
> > > at open time), expanded struct fuse_backing_map
> >
> > Yes, this needs discussion.  Amir may have additional info on this.
> >
>
> Having the two different lifecycles (open-to-close, lookup-to-forget)
> is by design.
>
> This allows the server to potentially move files from passthrough mode
> to caching mode and vice versa, as long as all fds are closed.

I'm unsure how useful mode switching is between caching and
passthrough because the server has no control over when the client
application closes all its fds (eg it can only react but not trigger
it). For my internal use case of switching on passthrough, I was
envisioning the server handling everything through direct io until
passthrough is possible (eg the remote file has been fully downloaded
over the network) so that passthrough can be switched on even with the
application having open fds.

>
> Adding inode passthrough ops does not play well with this mode
> this is why it requires the lookup-to-forget lifecycle, but I see no reas=
on
> kill the open-to-close lifecycle as it seems useful for servers that
> mostly care about I/O passthrough.
>
> w.r.t expanded struct fuse_backing_map, at the moment it does not
> sound right to me to map a backing id X with more than a single backing
> file or device.

My thinking with the struct fuse_backing_map expansion was that future
ioctls for managing backing files (eg attaching a backing file to a
live inode or swapping one backing file for another) might benefit
from a shared struct instead of needing to add new structs for each
type.

>
> I think that the maps of fuse_file to multiple fuse_backing is better
> handled by another layer of mapping (sort of a backing_mapper)
> which is what famfs and iomap need, but it is just my initial thoughts.

I like this idea a lot, it makes sense to me.

>
>  Joanne, if you are a concrete use case for that, let's try to see
> how a design to this use case may look like.

The internal team I'm working with is planning to start working on
their server in H2. They will run some benchmarks to see if current
passthrough and/or io-uring+zero-copy might get them the performance
gains they need, or whether they will still need the set of advanced
passthrough features they requested. I'll keep you posted once there's
performance data and if there is still a need for the more advanced
passthrough features (file mapping to multiple backing files, backing
files dynamically changing, enabling passthrough on a live inode),
I'll draft up a design doc to get your thoughts on. In the meantime,
I'm planning to send out v2 of the inode metadata passthrough patchset
sometime this week or next with your feedback from v1.

Thanks,
Joanne

>
> Thanks,
> Amir.
