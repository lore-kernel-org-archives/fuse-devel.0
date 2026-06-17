Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E8D3B0AE2
	for <fuse-devel@lists.linux.dev>; Wed, 17 Jun 2026 19:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781726255; cv=pass; b=MDhIyT1XlhJ7vOlxZYVrZ1y56xNiWqwRfDKNUYEKb17pzIhBWeykQihVsam7UsIDTfLEMoeW1yDlw8tpW/jevd5XJs+vsneVtuddXXs30GNTZAItWHX+d0dcrHr0pcIpUu7vgTbjm76zdLwBWyN5XS+qRn1hLafHhPXBYbjwxB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781726255; c=relaxed/simple;
	bh=zJ0IUeGHsdJdPluNaERbeBaxMQit3LG3hz6ZGuJa0tY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JSm/87zdGKolYrJWiOaJleRim0hohGNrYgeZ7IsUOc12VgPI0sAd6wiZkrRVuyfUbi8zWXFKYpR7a/8UJsnDQaxi1Pm7TdCK4BtficvKX+rZLzMyJymtiwvegs8iqm62i746yD0GuBW2xSlk3oGM0vwSIWuABTheyDzX0PZ128I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CaiTZoYL; arc=pass smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CaiTZoYL"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6a0b1edbe32so188491eaf.1
        for <fuse-devel@lists.linux.dev>; Wed, 17 Jun 2026 12:57:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781726246; cv=none;
        d=google.com; s=arc-20240605;
        b=NEyquUsQc+n5WdP0c8YKgcCezimXpyc2AeXDs3XNj8Ea4X1ynZZb2G5b+M0H0Rw+Bc
         uySVP7J3a6vXMDETDROzOM5+kodHXGs8bmVZB+2zmeenpGGCkgEtBRLCTPWqcHM6Pahr
         4ck6JU/qIZfdQGeLX7XxiFy7kgCvfqCJzh8nhJjLQA/6g/iCYAhiw655/lf0h83f2jer
         jz7Hb2UP+yu3r20m/YmTSxVM1hEmjMIyjrIZ32ctWfVQ46qNy1q0yR/lxKT6rLgQLOCF
         yrafKV36iRyzr2PXV+2zOU1/VRckC138risg66yh5kn3MuVz2Qk1cUUUkotDtxXk467P
         slDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i6aC/adY0+BnTZkQLrAHVNjq6XIIvBAX4bGpMQTnTwE=;
        fh=ichL8QGZ0U0G9R6b4i14D44mBKmKWFJvpEPlh8Jr6CQ=;
        b=g5FxXZYMxVzqlNmsYQyN9r1HhD17YtPXM4KAXdoNX99Gc7JAfTUqj+y52oNvPfhziQ
         17+ajYuiS1dBKAobNymZ/w+AXxoIv+Trs0mfLxM8ay/NVM1LGVNxheVJ7RF56KCEa7cl
         F9dff156esMTQLm0/fluzRCXolbG9/4ZSyvD5tk3RioFrT8GTQrAw/waVEDU8yWJbmCj
         MdYo6jmtnZ0gr7evmwgwcCVNbaIzbRldevspbm8iea5O8s7mDe+m5+KJlllA4R5yW0mz
         GF2xV7glwre8LXwcgmWgfLBSmq7fA37Wea8Zgm9+7QO8RLbyvd5Z9DXszGYdQ0KR/bdn
         AJzA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781726246; x=1782331046; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6aC/adY0+BnTZkQLrAHVNjq6XIIvBAX4bGpMQTnTwE=;
        b=CaiTZoYLO0HoZl/P0oTtm9M5wWyU041uYxv0NCPXj0pRR25VxhCnU5NIHY8Aq1EJSo
         U3sn8Up9OBSHDscNvXbrccy/2m8+m1hJnP/SrWYzs9TW5GSCo6+E8m7detawrN3zH6It
         +3NnO9w6JK95NY3TZYUkko4QuajrOJIqBzPMgzOHqwT8ajOeiZ+QiFX1BeeZjZxtAfVK
         0jovjSvTc+v4OlAe7q2eIJxDaoSmxtIVObAB7M9h4Yaqw8TsNcVYmXhR7MHzy4mA3vJD
         WxlSTDkGazDvTTjMZX/HnATHh3WXujEMzrmC4iszFzZU72dvSjowwpDF4g++yBOrDC1I
         Mv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781726246; x=1782331046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i6aC/adY0+BnTZkQLrAHVNjq6XIIvBAX4bGpMQTnTwE=;
        b=XelIizQZI4s6+8JWJ3ExcfFXR+73xSOQ2g+PbGyctXFWQr0O5F1G0+6ABSMa4SM9v5
         SbZeqqvlCmJS9qi2OFspEzP0Hgj8LEUI18nHjJbqAO1OyRm3Xue43AZ2e2iJ4v1fB1Vw
         JkVKJ1enq56V3vaT8iNQuxsoKfxBi0Y7d62ZczBltxeQj2QRll6Ys7Sy6ifNNmOYCbEc
         ArrxxjhaKI16zHccIH8UO6wxDWnHJxbakDIAQ+QqVzzHX0Rme+Ie20eeOH80lLcVNrHg
         2Q8R1u5xcjssOUdTEjDhCJsIODk44uBLM9dkoOJG550iHlizzq9prfNpu3yIB2TSlJzD
         Lj5g==
X-Forwarded-Encrypted: i=1; AFNElJ/uuKtjAJEG/B50zrLJ3iViJtqSZX922Gr7QPELKwSEcPSJmroZkAs4jI2cOYlgOOiVR3RAfrxVMf69@lists.linux.dev
X-Gm-Message-State: AOJu0YwZ9d4mPvdghbqVegiGT6jiJ34Cgqmz6rJPEiD9sD75/IZw+dbN
	wH8GfUy9cFqU7LNmibgZ8Up3POFeJAN4q35sFPE0ob96UBWAdwwtH53ZUAU0xPhznVmSvGqJVqO
	r84nNztXFNN/sRSPBjN2lPRxsePEURAo=
X-Gm-Gg: Acq92OHsSk20a7wE/mKl/PomhR3HncPxXdSPC6KXAkmzxRBc1XT3oDUFfweohIqV7D4
	9e1WkDMPsNTqs2sKHQ4kelb/FznjHwpazvnPQYo4PJk4sv4BXMYWaiZV+7k64J4yVft+VC+cUej
	bAh8+0hMlxC1TzocF7vQtagdyD6tXPeotRkDQvoEDNvjQpUwda4GPdge3S71+aeHT8xrktwSlni
	+xJLz1t4o1DTP85EYkjA5FAY4P1kOvQjXrPJiizkBqsukRYP7g/Hc+zK1RHCq4bw927mVI=
X-Received: by 2002:a05:6820:1c90:b0:68a:f494:e8fc with SMTP id
 006d021491bc7-6a0b60c0b36mr3762306eaf.33.1781726245995; Wed, 17 Jun 2026
 12:57:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260531010107.1953702-1-safinaskar@gmail.com>
 <20260601-enthusiasmus-canceln-anlehnen-0e62317a9784@brauner>
 <CAHk-=wifX_rrDjRGnDnOqE-usptAukuXKrmuPuVDP5bOCBWzGQ@mail.gmail.com>
 <20260601173325.GH2636677@ZenIV> <83f05c55-efba-4bf5-abfe-d2ab0819e904@packett.cool>
 <CAJnrk1Y9egYizkx1H9K0cqxSYuB+7vLvQbV7Tf4C5eHFqnnC-A@mail.gmail.com> <20260617-attest-gewechselt-tragik-7ed473860051@brauner>
In-Reply-To: <20260617-attest-gewechselt-tragik-7ed473860051@brauner>
From: Andrei Vagin <avagin@gmail.com>
Date: Wed, 17 Jun 2026 12:57:14 -0700
X-Gm-Features: AVVi8CcHFrVPI3Twv4VAYTkdhufN4WGXszz_j2JUYmYPkPtYdrsmDFCM1RURvTg
Message-ID: <CANaxB-zK5q=Xw6UZTmeFtXsDZjUsPkFk=p485m-wtNTBnf4hgg@mail.gmail.com>
Subject: Re: [PATCH 0/3] vmsplice: make vmsplice a trivial wrapper for preadv2/pwritev2
To: Christian Brauner <brauner@kernel.org>
Cc: Joanne Koong <joannelkoong@gmail.com>, Val Packett <val@packett.cool>, 
	Al Viro <viro@zeniv.linux.org.uk>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Askar Safin <safinaskar@gmail.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-api@vger.kernel.org, netdev@vger.kernel.org, 
	Matthew Wilcox <willy@infradead.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@infradead.org>, David Howells <dhowells@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, Miklos Szeredi <miklos@szeredi.hu>, patches@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.cz>, 
	Steven Rostedt <rostedt@goodmis.org>, fuse-devel <fuse-devel@lists.linux.dev>, 
	Bernd Schubert <bernd@bsbernd.com>, Aleksandr Mikhalitsyn <alexander@mihalicyn.com>, 
	"criu@lists.linux.dev" <criu@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 4:08=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> > After this patch, step b) is a straight copy which means step d)'s
> > fixup doesn't modify what's in the pipe. This could be fixed up in
> > libfuse to not depend on modify-after-vmsplice, but I don't think this
> > helps for applications using already-released libfuse versions. I
> > think this patch needs to be reverted.
>
> Note, nothing was merged. I deliberately kept in -next though for a long
> time to see how quickly we'd see regressions.

The bait worked. CRIU wins a prize in this lottery.

The CRIU fifo test fails with this change. The problem is that vmsplice
with SPLICE_F_NONBLOCK to a fifo file descriptor fails with -EOPNOTSUPP.

It seems we need a fix like this one:

diff --git a/fs/pipe.c b/fs/pipe.c
index 429b0714ec57..6fc49e933727 100644
--- a/fs/pipe.c
+++ b/fs/pipe.c
@@ -1253,6 +1253,7 @@ static int fifo_open(struct inode *inode, struct
file *filp)

        /* We can only do regular read/write on fifos */
        stream_open(inode, filp);
+       filp->f_mode |=3D FMODE_NOWAIT;

        switch (filp->f_mode & (FMODE_READ | FMODE_WRITE)) {
        case FMODE_READ:
