Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36503EEAE3
	for <fuse-devel@lists.linux.dev>; Tue, 16 Jun 2026 09:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781603619; cv=pass; b=qH3h2g+cLAvp17RBBgh8AHCE8LjADWrNLEiyvtKb6Qe9RmWpnq1tiXatmM/fUGOc2Bmqq1eaHuOqLS68pA+12jWNU/Q4hcLfxWTJnZpO7DppWfi67Pv2a5NPJ4Nedv829ShjTWTbocS73DpduuNV2J7OJJ2Sn2loDi200TqNAq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781603619; c=relaxed/simple;
	bh=T3odfu0cfZm3FOgPD1ZthQg9O8neCPky986HowpRTkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AaKMOZMryYNpExvUMw1XvQkWy2+tda1fnosJVZEyIAKKs/aX5+YdBz/6t0cJEISXFwmfbpciRYO1oDNnbGiZAXChFdjVf7QuDyQcAyq8toi3KdgB4BSpdylOyz5zGX2U2XUDjYRrWQi2L9w+yRpmMmQgQ+3RXCI4CC14cxX99pM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=m1DIoTRZ; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="m1DIoTRZ"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5176bbb9384so48414971cf.1
        for <fuse-devel@lists.linux.dev>; Tue, 16 Jun 2026 02:53:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781603615; cv=none;
        d=google.com; s=arc-20240605;
        b=UHm0JRgudu0DjGYB8E1j6jeWryWWFgsE7UiKgA0Y4F6QrO3RZbxGicdi8Qp0zWvFk1
         9wWTbnx+gbblooggF45OaiY9LUjqB7T3x68uDz1b5a4bBzQ2HPPFzq/kK8jpV4SbxCqX
         Q72i8Qk17C/pmbR0bA5Kdjgq2PepLyy3m9AZf/zNioikkmXYBV9ScIavOT4EKcCSRff/
         NmD1pnfmVZqoPwUI26gLpT4unpR7hAf79xP4BO9DzivhdS696OKDpxYuupc6WcJd447Y
         OdfeX8mRfM8h69W6Dt5jMh+oyOtVLHEjqoj6VhQ6chPVrnO1fzF08BBr6jgkgFvOlM4R
         Sk1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=N76jOeuIEDKx40fpN2XJKrbXFZziVtcHy6ikHEujW1Q=;
        fh=w2Dy9MBCymTAHXuuQoFoyTRhGtZ+o5YcX5Bg6rpudfc=;
        b=lftuuhqs6w1Ls/maSnJdwivMalQiGHH23n8Ifo5wbxECLB0YI1oFAFWc1OySr8eckZ
         PVCCMsxYkGhkDs6mFgOG/YX6UXUtExIAGzQQyHthyAFnlaK3aaVS+koXKxDcYVCdAMWi
         +Ja6slHh4+6i21CZazhmUgD1y/Kcu0KMKoz1Ei7Dv05AQGPpc/TTWma50jpYZ8PUZ2D0
         qcjYoB/FDabInDe5uyls5jizluNlyz9tzeX6lW9w2jbNq46NpAomm588wTONbkyhR5NU
         fOYpUx486ODre8ovRqeptg8ougE0qIcn5nTB6FJt658k/Lxri+oHV98iPd9SAbMYIz3J
         HtKA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781603615; x=1782208415; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N76jOeuIEDKx40fpN2XJKrbXFZziVtcHy6ikHEujW1Q=;
        b=m1DIoTRZNZCnm2Xtm11dIxMya1Wo73sct78TJ16haQ35htmb0TgKXDg72fryvl2PMa
         4QcQpKjYO53swF5iRhZa5vibOfBsO01BTrmW9dofnIDp2NVAb7yxIk81ywRqrRD4t/2S
         XoypVUYNwnrk4qDGjk4BkokUn32xUKnlblBJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781603615; x=1782208415;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N76jOeuIEDKx40fpN2XJKrbXFZziVtcHy6ikHEujW1Q=;
        b=pB3iPEDmJY9Dh6B0Iy85YnNfJf68ejn4H5/vEO9NQIfKu25JcvN9NKMKZM9kVfKnrJ
         3FUWElQRzVgkbylE6MbJ2OYPjtdveSs5aEll0iCbA8fwS3m91G4iVIfAgcI7MrAjGrZt
         81vnYayQvskahMqr9L71+WRHkoo9x5GqDq2nfCRB0M1BybtS2s2dHcZIvMbybLXTUc9S
         Apz+iyWP8/0ikQFUvH7SDQ8Iw6AXZpcvKIl2YDDQfXz9GKknTK0HIzlRo6jhxwOxv1Ov
         S8oY7erD7YxrHdLgSJUhKcFSiEUOJUqPimfKYZFLhx9Ziakm85y6wZrk7MlnWg/+FEnd
         RgSw==
X-Gm-Message-State: AOJu0YwVkn20vdPPN6spmCf7VRrUgV1kwFNsR8z+oQiAKLeyiQtgRUf4
	EDl1Qutm+GJCu9LoNyxfLZsVF7vt70WYfQ1j05vLARG2IdOJRJxkAtmqa4aEMGg0qf8rC04j6R3
	kpBmiPHZfz2n91JrBfRwRItt26F6KrNqlV3pIfvqOAg==
X-Gm-Gg: Acq92OFLZqJAmkCYH1+KKzY/v6K19SPkT3Nf29JYHDCCETsHYMzNUzEBWHqwdRToDlx
	2jLQ4DS23lnf7sCYT43RbflPA5tzXxf22FpMFAu4vHq6Y83GbvxRRml+MMRkhKFYwaBfz0Jm1Il
	Me1S5QgFxZZYRg3RWcaEZBYvazJJc5KN22SmyT5pQF/7zA54f99NFNr6SIRNvzQya6v0bah++Xh
	qQnpHEpPULwoT9TbWDfk6xSIe0D2McU+Vk+fOLiyPR850Qp3e9qexUZo4wcOUWKgshxj50AnGXx
	J4f/+DEQiwpNBxXdgES2RnyVfqUjgdk3VHy9eQ==
X-Received: by 2002:a05:622a:8c18:b0:517:92e4:4294 with SMTP id
 d75a77b69052e-519916a7cf9mr34775941cf.22.1781603615467; Tue, 16 Jun 2026
 02:53:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612210513.1516038-1-joannelkoong@gmail.com>
 <20260612210513.1516038-10-joannelkoong@gmail.com> <CAJfpegs+EY+eCDOkBgVWhUyd8hBLE3bFY2oaum-k_tS=Cv2SVQ@mail.gmail.com>
 <CAJnrk1YiUn3JFZCEe5oADyK5+zx6Rh_6KTZbCzeHUjAebUVQBw@mail.gmail.com>
In-Reply-To: <CAJnrk1YiUn3JFZCEe5oADyK5+zx6Rh_6KTZbCzeHUjAebUVQBw@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 16 Jun 2026 11:53:23 +0200
X-Gm-Features: AVVi8Cc5ZqHKcS2iDHX-MmkmMkYsULB6j517ANLVIKZXc0HvTQqdga8w6KhA5F4
Message-ID: <CAJfpegvokfiN4b1tEd+fAPfO8n9hSQKeXt6-UM1OzxwHYA5-hw@mail.gmail.com>
Subject: Re: [PATCH v4 09/10] fuse: add zero-copy over io-uring
To: Joanne Koong <joannelkoong@gmail.com>
Cc: fuse-devel@lists.linux.dev, axboe@kernel.dk, jlayton@kernel.org, 
	libaokun@linux.alibaba.com, bernd@bsbernd.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Jun 2026 at 07:46, Joanne Koong <joannelkoong@gmail.com> wrote:

> The userspace FIXED_READ call (eg set up usually through the liburing
> api io_uring_prep_read_fixed() [1]) takes a buf_index, not an address.

AFAICS buf_index is required, but is not sufficient.  The fixed ops
require an address as well (to figure out the offset within the
registered buffer).

> Userspace would pass the ent->zero_copy_index as the buf index.
> ent->zero_copy_index corresponds to the fixed buffer where userspace
> told the kernel (at sqe registration time through the "uint16_t
> zero_copy_index" init param) to place the zero-copied pages for that
> sqe.

Okay so there are two buffers per sqe, one which is corresponds to a
real userspace address, and a zero copy one that is (by definition)
kernel-only and doesn't actually have an address.

Passing a NULL address to the fixed op seems okay in this case, but
that means the offset within the buffer is always zero.

Or am I misunderstanding something?

Thanks,
Miklos
