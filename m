Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6210937998B
	for <fuse-devel@lists.linux.dev>; Wed,  1 Jul 2026 04:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782878485; cv=pass; b=F3bMmONQEx2Bf6oIMM0w8zjl5rvv2HaLx1b60ZawnAaB5V4CPg4y8HA3U4zQW3RbIuucVADGrl/YK5t2lDkI2Mo0YngAXfkoFQFoXwRLn6cPUm3IhMfj+pYuur6oviPPVGWNa59HvlcMazxoJoMw+IXcji24zkD3TCyNikq0i5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782878485; c=relaxed/simple;
	bh=nbcaEzsRX9Wd5cutUSGHKNyzPWPZ9Pa/dME/ipm/wTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kDztPpwNzULoMJ6ZFd86sdqOMQfRdrm5M9OAHqdVpl2q/K66D5uTaDe5Dt/4dGOqZyY0jJEchAmEk1Oi+MptBS6rHIoPM8/LKqqx6WnFi/YOgfYi2pXosGf2SWtNVr1PuFJ9705KvyMOJQjWZhmVcwv09qTRnUnhcPaZLzVCJm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HrztMUuC; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HrztMUuC"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c128cc012b4so25937266b.1
        for <fuse-devel@lists.linux.dev>; Tue, 30 Jun 2026 21:01:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782878478; cv=none;
        d=google.com; s=arc-20260327;
        b=YhgS6k+6aJJG+6DWGY9HJVRhgLcQ018a7PEUBIflt1fEH5NqFSG5QoMC4tXHruV+3E
         Mfp6y2qPaDBdDfsobKWD9TKaMQHt/g8z/gjwoK9xCNitddhQCpBq/nPLeyqcH+J9RSj+
         jFpejcc+QBjSNcrgx0PIfWtMwC59oWQDgLugP+XnIA2/HhFYSUpEprtmx6eQbqB04tAw
         OctiFtCDiv+dvH63QRDh0t9/s/FUZ+sRHarLncZCvnu5BKX59x0dD2zll8zKjhAI3EgC
         DqD6naGqcZvzjCXZU9dNShkYlj09WkpJ1nT+DHEF7ggdUwJjQ0Nq59sHZBxWlinYsNEz
         mx3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nbcaEzsRX9Wd5cutUSGHKNyzPWPZ9Pa/dME/ipm/wTw=;
        fh=Bg5s00VtGbNey/ub5YpCcLz9INoRXpg71uT9aPqbuDY=;
        b=DcwDGA0pWhB53HMq7EyFmxJ2Qau36dU+ymRsBx6eEIR3m6WGPXDlSh+75K0n+rwPkN
         mE7i0IUU16KbF0MB+JLSQplxtC34Afz1D4RGc5XasDllDP65VFwJ9Mv7+kcZOHOf+5/c
         F50/EhDR5No6BUds39hXKpwvJPBzT9qZBbydOVGqA40xn30ChZh23vZokTD8X7o/AT/q
         7tFJbGD4m7CMz92czkLyw08Iv6RmBvzjYVNLYnzDSkktHnn+5ct5y69N21q42a6r/KCq
         1an2AN/jQdwKfZIuO84nzD2LDTys/I5ur8u7M9Qy+YzMmp/v5EfWI0Dt4ZzJxJcO0wAV
         Ue1g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782878478; x=1783483278; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbcaEzsRX9Wd5cutUSGHKNyzPWPZ9Pa/dME/ipm/wTw=;
        b=HrztMUuC2ldsrEnyI3URml0a5v4CnSvu6crck74IOYVNkSfnNt1DFbzbBvLJLSGtOV
         uzW++8KLaHngXXdCWrwpZAQIzTtMgx0Y0V/RveKFj25ZHfw+1yOJVKBKr5Tw43IX0rjW
         l/eCk3QLq8mY1BNRPB1XioUFixMlIXgHZBRPmFsGa4ztCgmqTuwJQjAZ11klsk1Mmoj7
         NEiqPsOONmQMJXdWuMtXeLBd37yhE1xWIVfs8LQDIhcy4gyhqW+ETICMKXivW6U8Ea1R
         zJqmVbX35L8mDDyq2YSWR1jkAyluYo4IvvvjrWt17xZhHuVWR+Nyq8rIARhb7w0fyTcs
         8dYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782878478; x=1783483278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nbcaEzsRX9Wd5cutUSGHKNyzPWPZ9Pa/dME/ipm/wTw=;
        b=YLgC+4d2PNK2QhpjXFCJVJfr1HxetWrR1HeBFYT1SK2r3a+9aStlxuR873ABuZKQSI
         xkkA53pNLkwLQcNz4yF2sLZZ2ipOoUlyMSVQLyEpBYRPSJPNO1/+gxGsJnXUtit1gaLe
         cuqeiqTklj0lICTIj+OLasqNiIob3hBqL5HJEH/k6HVxhOD2n3qYAhMNR6+HqDa+NUGC
         bND7EH81wsdTbpaPjtw0QoHNo87kDJv3ob2z8agyrmYjXFEUoMkHkBr9u8Cx4n5JxCkP
         0ZEZgpu2lhsc4TB+NlaQtMvOAT8PnotUU/XpbR/FUcTgOFM10EQ8r9Df6VqLd6rghMUn
         zoCg==
X-Forwarded-Encrypted: i=1; AHgh+RpPmiQdN5ZrRJDhfK9iGNP/rIyLEWLkfvoKUyfrSzZrUYvhXzdV+MwzG7NK9xSO1jqhpFITBRx+9YY0@lists.linux.dev
X-Gm-Message-State: AOJu0YxywNELAyr9yCLfVBLRckujUmkWb/ngbhXwfFyVoNg6gKhewAw/
	rsZd+K67gcRZJKO/A6k+JngPMt2ZiY6S2Yr+Luh7gu6JDw9NZ0ReeobIWmUm7/9kvJtwclSLwHa
	VVZuSAKMccrEGC/SC1foVpFEvwMMyBsA=
X-Gm-Gg: AfdE7cmMNIuTxl56Ns7oq9DVSflShjAy55k3nCKir1vfHIrQo1sVs+VOozp3X4LAyyG
	4lrKcil1IC+iHO99is/qL8cyVJrRKRPWKnY3T2Vu3ASKymO1DtVlYSuEBi+IlHGHa6/9nKlHKVu
	oBQwM3Jsr8suBX15H2PwBu8W/yqUSgU/1XLPkBUYCGvNs6ziMFjmK0ZayMpB3A0B23hrt+RJQgr
	67a6aJyQzDMlQCvuFIZLarXsdSyxJd0Po8Eb6cVoJ/wFJ3fcyYSjsEY6hYQx6hHTIwyhX+HxkTA
	Nal7HG0=
X-Received: by 2002:a17:907:9694:b0:c0d:7c31:26a9 with SMTP id
 a640c23a62f3a-c12a79b53f2mr2792166b.2.1782878477949; Tue, 30 Jun 2026
 21:01:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <89ea76b3-e956-4232-8180-ee3929adf905@kernel.org>
 <20260625101132.3859505-1-safinaskar@gmail.com> <63f7860c-4f5c-4682-8914-27978b9fbfe1@kernel.org>
 <20260629-bauland-knabbern-abgeladen-c0acbfa62cc2@brauner>
In-Reply-To: <20260629-bauland-knabbern-abgeladen-c0acbfa62cc2@brauner>
From: Askar Safin <safinaskar@gmail.com>
Date: Wed, 1 Jul 2026 07:00:41 +0300
X-Gm-Features: AVVi8CdRVGURQNkveI8Kk-KHYrlO3h9NseHLMt2SfGvb89Oznrvksp3ZeC4J-SY
Message-ID: <CAPnZJGAJROqfCWSeeBu31HsE6nmgxVqHTNeC554S5y1Y-VN19w@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] vmsplice: fix some problems in my previous
 vmsplice patchset
To: Christian Brauner <brauner@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org, avagin@gmail.com, 
	axboe@kernel.dk, collin.funk1@gmail.com, david.laight.linux@gmail.com, 
	dhowells@redhat.com, fuse-devel@lists.linux.dev, hch@infradead.org, 
	jack@suse.cz, joannelkoong@gmail.com, kernel@infinite-source.de, 
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, luto@amacapital.net, 
	metze@samba.org, miklos@szeredi.hu, netdev@vger.kernel.org, 
	patches@lists.linux.dev, pfalcato@suse.de, torvalds@linux-foundation.org, 
	val@packett.cool, viro@zeniv.linux.org.uk, w@1wt.eu, willy@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 11:56=E2=80=AFAM Christian Brauner <brauner@kernel.=
org> wrote:
> The amount of regression reports that we got in short succession doesn't
> make it likely that we can merge a plain degradation.

Let me repeat: this v2 patchset fixes all regressions found so far,
except for major CRIU performance regression

--=20
Askar Safin
