Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC01C8EB
	for <fuse-devel@lists.linux.dev>; Mon, 22 Jun 2026 18:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782151414; cv=none; b=gKLLk8HC+ffEp3sb6wuXsSHutRl2jvuCrhRvG18g2SJhLuiPKAoJwIU8CtY6jIX5+SSUefjQOpy1NLGcydQvYkvDIsMOeyzPAwzU65qJdA7h+UYO9zr3cXdfJlItDws73av6dnYZvxNNWqo4J3Fvm5EzmYMtS5eX+p4JDty8wic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782151414; c=relaxed/simple;
	bh=IEI2FLJpVO4OzJDDyINZSihn/wHI5fjZHQYKezViWww=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=e4/hT5Kr3is5JhH+h8WLRzc9GVj3t4A2Vb7d5jCElxHzIoGYk7F29ufzAyEkxZToBaBG25NS3noHbB8SeRP5Vj2GZ5NRUpulR4iiV3KUjl6ropF2/rCFEQMYiBFI9QC13i//lqDtk/Y2ONlpV59qWVki8f7i1NN9PobfEvvngsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3R9zMkf; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3R9zMkf"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c07a6527453so669968566b.0
        for <fuse-devel@lists.linux.dev>; Mon, 22 Jun 2026 11:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782151412; x=1782756212; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IEI2FLJpVO4OzJDDyINZSihn/wHI5fjZHQYKezViWww=;
        b=e3R9zMkf8ifKccnDkP3+2FOqL0mPXTspqSAvrnqNqDREfvNCTvIo/X9eATqWPDMe7p
         hSHh81HfgcNjYpXfB4SRIardUEh2QCkkX+KBRZUAFAZ23yLsbP6ewKa52OqRPZtAUp6e
         wuUfJoZRybQe3k062dpjRpe50ypM+oxOjafeIolSgu5WcCT9aQjFdz1fJxyCx5GNcVfZ
         HCXiiyBFNaKuImxs/1AbobZOQQ0V5n5gNzsoDv8EPN3wI9z5spoVM3hBbKlojLPpevtS
         3Nmda21hOSHJans2RCQcuLmYthEu6DL6PZgfNUjokkTc02xZ1gPbUFzDuSBnyzeMWmp9
         vUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782151412; x=1782756212;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IEI2FLJpVO4OzJDDyINZSihn/wHI5fjZHQYKezViWww=;
        b=T6i6hKsRyEBVCFOEJl/uimkm9bzHI9cFZTYlVjffOObNTdKGfuaMru0ypc2ZQ/TnWz
         x/gvFYoPBkT5WgyGUtjjpwpJuT0XGazuytLvw1GZtdzfx8nnYHdJLBeCDk5RcjGFBSJq
         UOmbDZyPS7opoZ32XpXWu8hIAqdt0rUCo+tn8bYBgkA6u1SmjPNELRwuCMLU+potv02x
         4o762vARWykmWNETBS1a3DF/a/8vvTrZMvSF4vZGAc2clInCZbVfOybJuY8sD7aKtuHz
         DsJcceM//6D6yPwxk4BtILTE+qZ/dZGSXcugZh2BE8DLfiR4CNa7twSMUSixGP6yRCOo
         CVIw==
X-Forwarded-Encrypted: i=1; AFNElJ/qxA+npfSXqursOZ0jixS+BlQoLfUqpBdsPp2Dn2Ly7nMNVJdGvAjwE6EUC5AB+lKMaS6yDduyW7gc@lists.linux.dev
X-Gm-Message-State: AOJu0YwbL6tdxbh1f36GUeMFzAU6rG4oX3ePb6mjb1F1RdaNyyLPUBLG
	HaGut2XusrmtJPzhTu886ENdMXg9D0GxAHxgE64XcZAcWwxnVaqP5dlB
X-Gm-Gg: AfdE7cnXK6/4IpXSX3Yyq4F/h5JE5iShzl5RoouafdPg4IfrGzmHZ8t01Hqh4SSIHHb
	a5xnwXVe0G30fhQyTtjrtmzIiOznqjmysro6uqdtGTs0bjC2X7654aeWEc5umWoSKTC3SoUyhPv
	L1hiOArQkRAncNw+GyLlDqzkX1GCSn87upLR3OcJAVYRGY5OIReaprV/ixKJRQTSFGOltZjSIMO
	Uabdt9y2cHOCiA2GJztS8YhVJEWcAEM3KAprsCXern1Xm9FGx9V08k+fnOCFLnBuk1IhJLag4R0
	MUdHDfbU/UBPEvJHsBq6axn7AEyFvx1DCDHRf7333eOSf2zna5xd6HSF52Wq2J6fNLopa2h9k4d
	xHAYyxA7+rMyFyCP4o2OBcMW0PEMzaIo4k2hfGYX35+lGvdl9J/myACyec7iUYNzVQp89j5P9gx
	msXu3JTrsStIarrDA+LlY=
X-Received: by 2002:a17:906:4fc7:b0:c0e:84d8:f181 with SMTP id a640c23a62f3a-c0e84d8f31cmr263028566b.38.1782151411896;
        Mon, 22 Jun 2026 11:03:31 -0700 (PDT)
Received: from localhost ([72.255.58.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c610e12f6sm411250066b.47.2026.06.22.11.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 11:03:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 18:03:27 +0000
Message-Id: <DJFRY695N35Y.2GE7B8MVNUZT7@gmail.com>
Cc: "Mahad Ibrahim" <mahad.ibrahim.dev@gmail.com>,
 <fuse-devel@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] fuse: replace passthrough backing-id IDR with IDA plus
 hashtable
From: "Mahad Ibrahim" <mahad.ibrahim.dev@gmail.com>
To: "Amir Goldstein" <amir73il@gmail.com>, "Miklos Szeredi"
 <miklos@szeredi.hu>
X-Mailer: aerc 0.21.0
References: <20260621183157.3490-1-mahad.ibrahim.dev@gmail.com>
 <CAJfpegvDK7aaMJHmPXxXoJs_MfHe=TBUXWoj=_yA1_m7T8OkwA@mail.gmail.com>
 <CAOQ4uxg7JMQb=-tPFxBBQO5dZU-64uP2-pstZDyVSbgG5QKUSA@mail.gmail.com>
In-Reply-To: <CAOQ4uxg7JMQb=-tPFxBBQO5dZU-64uP2-pstZDyVSbgG5QKUSA@mail.gmail.com>

Thanks, both

You're right, the hashtable keys already are the set of live ids, so the ID=
A is redundant. v2 will drop it and use the cyclic counter with the collisi=
on check as you suggested.

I'll keep this patch 32-bit and kernel-allocated to preserve current behavi=
our. Thank you for the heads-up on the 64-bit and user-assigned id plans, A=
mir. I'll keep that in mind so this doesn't get in the way of it.

Thanks,
Mahad
