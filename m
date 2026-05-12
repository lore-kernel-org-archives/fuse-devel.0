Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF0F2E8DFC
	for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 13:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778592164; cv=pass; b=aX3xHUCLD7KcubtdC5rbv1TBJcRPwtPE3hLOPbUEElFS3gQyd7do3A1eSO1PHAYN8hJ7nmUBYU1PCAC0/nVIF7OpAnUvR2ko9WXkqjacFLBbwdWs2Ycut4o9NwLQF0uCfSXV5zkc6kN4jBmcpIEG2CCiAEq0AjPRC1B8CQz8gT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778592164; c=relaxed/simple;
	bh=CmODMNUrJwva44S0HSVL80Zk81EoeNnwtT9hGsOQ208=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tnbEnj3OahgooY1zh2KueVAmhU0RbzJMPyB0lhBW+1rGAf/ImGhIcy9lwoOHcK7mym1mc/+PuyjNGAgv6HuvNG7Wa1lcUDsi30i6ye9mC2xEiW4oOPbAYEeXzXtPKBF95uXFc7Qc5xapIDPXI/B3yvu4P667IIfx4uBPRhhA3wE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/BvcboR; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/BvcboR"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-672645dbfeaso5614651a12.0
        for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 06:22:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778592161; cv=none;
        d=google.com; s=arc-20240605;
        b=MQxPiH17Q2gq0EFIYjwvcvDskrnoKvH8NrXQnzGTsg9Be0NpvdeUP/L3dNwNmDCxv2
         U3KTUC1QRWlCkHAfLqjbhlbqxBcQTiRw1mpFKKew6rE0XZfqQn3hOoNcxTpw+e88EYxr
         JKHSbVeZwqku7vAKsThJr/1WC+WyLvaIcG+RgtWx3Q4U0SgzRcihHysxZerWRWN7KUoK
         2/8YzG7DZhi7WtCVCfrflXULEUmgUxg1CkBeVRhQeWbb3Z9mdeYnxBONp75Sku/BI6q7
         VmhczIb/lV9bwTTxuOwd6QKlBHay/Ps/P//7BXWmxkqBFQBNMCPrQuSXLLaTHqdS+aNY
         xYfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rx38VwJ9mLgM3NjUfqPkMzkkJTQ3yufriPs39QpBr2o=;
        fh=KqlhZFMEejLd4XOlM5yttdSjZFDdvjcCNrUK65zLpQk=;
        b=GAUf1saUNny4UN3Gql7yvMHy+jqJa5sxGp+TazWnRGlzelfCb/SlDAkQnyfbFz/Uv0
         IrVBeWY7sqHpFgbH9EWcDIC8DHOqJhNtjUd7EZUUjxtqLN9wkxPI9RSqjWjFdctwRKjE
         nXMS2ll+WBuOhjs4jpfCtyI8hQsZASSIexif7GgbYR31rYjCH9SYCvJkZM93MSuF5RKw
         4tCki366KGjjKzV51z7vhLVzooYcYourEElY7lp0CAYv8NrCDAfR5iX7pidNEA1VUAvB
         DK2+QOXdurP0OhbLgD+nFwfDmIymzdESbHJysOHbQDkMigH+i82+jVyc73d0abOF+KJo
         uKqg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778592161; x=1779196961; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rx38VwJ9mLgM3NjUfqPkMzkkJTQ3yufriPs39QpBr2o=;
        b=B/BvcboRnBVuYu6F2Tf0rFpmbxOy6SwdBa5cDCuGaipOGsfWPUGpHiL0fVRRrARioU
         CFLWZquG+ot55lHZW/5fs/KdNLFiBLJ5wyUmH+kzeAvNaxhBq9+L949dKFbygObw9haR
         jy0875LRbAeon8NCluH3f0PE6jZhTWwzcozElQSaGhcxvXFtvm6AJSE+cRhzdxiRRbwL
         jTh4amhgJBjTqVW1WDWPJK+fp15x05WvRgj2u3d8UgqYY4l6jg6OwwrCssX2Cid29k4j
         bXI7SWR4MarY0hgUd+coqaKObh/d8U72+J3UMsT9v8eePb8cRUD8tXO8mktrXj4Cs1Mc
         JlJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778592161; x=1779196961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rx38VwJ9mLgM3NjUfqPkMzkkJTQ3yufriPs39QpBr2o=;
        b=JFrvrRc2Sof7o7r0lV6/tvWMa7iyI7dt8/Qa8LeKYwEnWnkoQpqX9P0lAfelRnH8M7
         uh9oEe7gTKSA6spvvdBIiXTSFIkS4m8+pvDkuLjL3pq+iQdaQwKvFvJZg6ubMG3/HcJ2
         4Qujl01mcIfsg7vP+kpFqXkYIk36jJvQFJVUoCjmWjDf1oe1WNere5K4ROLmVlocJaRC
         bou332x6/jc1HSRxbVX5c20ZFldBaoGZeJpeA2PXdEUdmDO6ui3xV9ish6AcuJZypwtw
         WEheqUlZyOhXyLTnR9GEuoHFc+nRSWJk3Odl3jUPffh26t3CwSLlL+3A4fcduVy6M8xU
         WnNg==
X-Forwarded-Encrypted: i=1; AFNElJ8Yk3b8ALMW4z9vFgqWaVXxx92ePbz5b6NEa5RenrjnezrfVgbRhQQjo8WPleSOV47ivFTJk5nWvE4G@lists.linux.dev
X-Gm-Message-State: AOJu0YyjP1IdmlHMyRU9qmM41W6II5KzX835l/K2xkqG/F0j4bZfMS5X
	MFNmEQjOsMw9qZw7PddsdeU7OIISh3NQCl8/cggXjSR7JJebwSNVu13aW36jQ0XxOPIxtA6e6Gz
	mb7B32NZE9C3ysjFMSBKcvQHfUYjKa7Y=
X-Gm-Gg: Acq92OGIq71eWlRanIHtPkLC06oZ4QW3DFLB00vC2dkf6b9XFu1TadBMOjZlELXB7Kq
	xS9ago3RMr3DhgL8fq/ZBvR8JHYMkJB0a930e9Q7sBdfMbMkQEFPzK1PctXKgAmSZ8N8+//OWgK
	FDft5PrgWe8CjH1nrb9xWCzJH7DlvCGd9alGX4VXVImcfHPA/wMROgBSKIu1q0jk5nsCB+VrFzI
	EEFWyJ2L6dnRgwN24HRMNKtdWht+iyEigdAGDV/dWOYH9mg72lpauCICDafNEr5zGDl05lIIYH+
	6vEQMMtM+R+dlnnD9zMvhbA1sCdm2Fuu0Wd1xNmJ
X-Received: by 2002:a05:6402:29a:b0:674:b355:555e with SMTP id
 4fb4d7f45d1cf-67d643bfa26mr10574254a12.17.1778592161133; Tue, 12 May 2026
 06:22:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260429102058.1362965-1-mszeredi@redhat.com> <CAJnrk1Z_JWtuA3UjucF9=YH63AH_-J_0hzr9jbY99Hx3O8YrAw@mail.gmail.com>
 <CAJfpegspraqMp1Z3mi_csiw6haawZPa4zWheSUN7MhBy47aYKQ@mail.gmail.com>
In-Reply-To: <CAJfpegspraqMp1Z3mi_csiw6haawZPa4zWheSUN7MhBy47aYKQ@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 12 May 2026 15:22:29 +0200
X-Gm-Features: AVHnY4IpLWVuGINjTtdIOiW6Q13XsruW-Wn7tJW0RAPYsusRW9h0550GyHT4zRw
Message-ID: <CAOQ4uxgV4_Pet0w3f+Sq4kLkvgKM6FyJwZ4AQsnvctC3w=dP6g@mail.gmail.com>
Subject: Re: [PATCH] fuse: add fusex filesystem
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Joanne Koong <joannelkoong@gmail.com>, Miklos Szeredi <mszeredi@redhat.com>, 
	fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 11:31=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu>=
 wrote:
>
> > * in passthrough: backing_fd passed at lookup/creation time only (not
> > at open time), expanded struct fuse_backing_map
>
> Yes, this needs discussion.  Amir may have additional info on this.
>

Having the two different lifecycles (open-to-close, lookup-to-forget)
is by design.

This allows the server to potentially move files from passthrough mode
to caching mode and vice versa, as long as all fds are closed.

Adding inode passthrough ops does not play well with this mode
this is why it requires the lookup-to-forget lifecycle, but I see no reason
kill the open-to-close lifecycle as it seems useful for servers that
mostly care about I/O passthrough.

w.r.t expanded struct fuse_backing_map, at the moment it does not
sound right to me to map a backing id X with more than a single backing
file or device.

I think that the maps of fuse_file to multiple fuse_backing is better
handled by another layer of mapping (sort of a backing_mapper)
which is what famfs and iomap need, but it is just my initial thoughts.

 Joanne, if you are a concrete use case for that, let's try to see
how a design to this use case may look like.

Thanks,
Amir.
