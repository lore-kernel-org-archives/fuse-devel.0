Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE26378D72
	for <fuse-devel@lists.linux.dev>; Tue, 16 Jun 2026 14:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781620372; cv=pass; b=iusWaeQz5+rKa1gE7fMI2s/W6qedvwrImMOKURuh2TpPAjFV9HO1agG475+flzJwagEktVRyzrWcfJVmGTJbGFAFv0XfAswD6lkjU/+btyh9Ane1672AMKo+YiCePsUFdG37IxDwXKd7VOplGpRwz5iIygP5SA5m+YrNl3RAbrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781620372; c=relaxed/simple;
	bh=qYf76rQcTsdQm5oNAXF0ipWi+KiR+RGX2BosUuLXeh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N7rnnsqyONPxdjPeaoJD4mNI0pvWjH5CGw8RcKr482pzx858lDPwOIqIXbwhqxqcsdIcnELTao9QZELxstINhWBHQj8nqNMTJHzYMQ5ms7zyio62gLDwyHoqv3MbiggibCfQpsYg5jVmpZAiWrijNZrz6JUbjeamSSYsNuvoWwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=Z4PQc34M; arc=pass smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="Z4PQc34M"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8ce9df31130so68779776d6.1
        for <fuse-devel@lists.linux.dev>; Tue, 16 Jun 2026 07:32:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781620370; cv=none;
        d=google.com; s=arc-20240605;
        b=WJ7aulUdaUUglsgK6lDAzZ71QH1mrAWuduOJqcbG/YWHh7cFuMjwJbyE0nFC/0gFQW
         VIkS2wmvmE7BbDDjxPCy5czxuSZUsSqQw2FxcRA24pCxhcgT5FOAYO2kXutdf5ztY32F
         UEai5+Wzka/CZ4523x/I+Lc6xk1FWZjlCE6BuP0Z2AIkjy7d8DuvqqPEI81fTjhi8Aay
         h3mAmLh8ZJbApietmiBQoNJ/rhiLicmLgmt/gWmnjwuAmo6BPYOlL/qyC5MUYEernKJd
         /c4MWZVJL/Wg5Vc4WcvI6aZKUKAJn9B739ObFiZxQN4ajUfCH+tMiRVvAJxMF7mFepxa
         iqcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qYf76rQcTsdQm5oNAXF0ipWi+KiR+RGX2BosUuLXeh4=;
        fh=uzU81CIwrGKfsULqPeXiktajouTgWaFAMqVjwuFOsbY=;
        b=I23g6P82PsdeqHfdKJpKLD5nCE6OnY0TZqMSlSNlwQkRIgSVJlTGMgLBZm50jm75/V
         tFl3a5UFlHVio2ClQAx7/aSdZi6g4p06phCISZVwNcEJTlgzj4+JN0QPipur1mpYkdKX
         /kBuKMwCf7OQm9pIoexEx06Z4A81TfIiPX6pOp3eGo+URXDwx63KJ26ES6y0pMvrCOem
         276mN4n04xNHCqA5mD9euDgCacAD3VWIf7hCVilQk4+FyWw3hKcZSaGsHFucE/c7GB0+
         XlWY8GLIsRU6GvwGjKgrfqEgbNfSKmb+RV2QcT55n+Zgx8xGs/3y1wr2dZDN61qtv0GH
         eFtQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781620370; x=1782225170; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qYf76rQcTsdQm5oNAXF0ipWi+KiR+RGX2BosUuLXeh4=;
        b=Z4PQc34MD9wuWYCUH/mhc0aMQSb+2C7Bk+MHFuj9ZKlS3fBn3zA2JvUcnONQjAu4UT
         Pp+ujO7dmvaViKm3dkg20DeM3cRh7MfJ8MtW9nDQ8w2ErtfSqIMZ2sEvTeOsh5BwuP4S
         H2cYcCV2aldY5njgA7zaIjPh36G4dbfybN83Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781620370; x=1782225170;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYf76rQcTsdQm5oNAXF0ipWi+KiR+RGX2BosUuLXeh4=;
        b=DInnNyS9E8xooHsa9muEJ5cOUgNqReK2Gx7rEJJa9zXaln/fTrfFFSg69cO5SkWk6e
         gi+yd0ALXkmx9s7iXZRxa9IbBMfxbkyZ6M39NUsLRaiG71yv+kEcKQRtM6yJTU3P0/m/
         hFxjjVrVJuPanPKFDSH1vCPVDP2j0fxKF7WmbCpUIrtlEvit7oI9UkJM/Ti2AfVLo3mK
         +j7DWWE/VDdxDHEPAeF/jleptSLXLDoLzJq5QGVGlLDRgGHScLrgvtbls0/JSgRmX7/W
         nqNHH/IQDe2B5v99ju1DauIdx3h6qcyrZmCcaeNp1DS2GRUdYGPrzPVRxTU4jzypAMAl
         L2Nw==
X-Forwarded-Encrypted: i=1; AFNElJ/NlrNt9VzflSoHzvldlMELiMz+ib5DI6poduNJ0lgbOk/jQNUIhH+COR/FfUqKJ5UuL1F/XWL4ys2E@lists.linux.dev
X-Gm-Message-State: AOJu0YxFNK+WetO161Mkw3EcuTR83Ovb7t26TsXbOVNtQVihzwQQ2Rrv
	EZ/xDlZZKhZ+5WFSmOLg3ZXWDmS0vyjOojpOQ6BK8OkimIdjU9WnzUxkB2tqFQ8GBRDbLhA2dAt
	/NCCFzhNZQNewtnbPLS1fPsQcoNU7R+QmMfGO7AF4lQ==
X-Gm-Gg: Acq92OFV3Sam1qKhg9k7nOZZglZPZJ9E3vgaDZ4u1voJbVXBtfb8FmcE81i6ADHnNRd
	QZ9QYbLt7aGkSylgs1Tf9dx5uCOKHl5XzC+f0BBbvf9mp+dqkXcsxxgZa+Sis3CYmZ+a2n4wEwQ
	adaxIMr39uXQEIbUZSxuLeA+KZxMMwcqwAQcHUo15cFAsppXpQrZeRG6tCnnRAqDZOy5L1tyLP4
	K+rDXJRIeLBuSBx2cy3iwR+ZpsBqqQH82W0exH3bdBS15CF0mdAE0EOF2kJZc3NKB2Flnpc73MW
	0DVuEK/WHFRRCtThfIGSonmJj1qf1Uowi1A+Iw==
X-Received: by 2002:ac8:5e08:0:b0:516:d557:15bb with SMTP id
 d75a77b69052e-51953554bd8mr239431781cf.46.1781620370090; Tue, 16 Jun 2026
 07:32:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260529134302.1989958-1-mszeredi@redhat.com> <ah5-40YypaswEG-1@groves.net>
 <CAJfpegsJj8cZ=CXL-VGeVDOayAeTzstWJgvQye3N+sudHJ5L9g@mail.gmail.com> <ajAlcVPGa7ytSWOm@groves.net>
In-Reply-To: <ajAlcVPGa7ytSWOm@groves.net>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 16 Jun 2026 16:32:38 +0200
X-Gm-Features: AVVi8CdzKNX6pCMQRYh8T-XAvu5h6XuOLr8CoGsdpXseiXNTzAqHMmIMt95ja_Y
Message-ID: <CAJfpegvjUpVROuPgG1YiCd9Eg1V8fPtrYaQ+3p_1XhiNo11VGA@mail.gmail.com>
Subject: Re: [PATCH] famfs: FUSE_GET_DAXDEV -> FUSE_DEV_IOC_BACKING_OPEN
To: John Groves <john@groves.net>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2026 at 18:20, John Groves <john@groves.net> wrote:

> Apologies for the slow response - I've been traveling and juggling the
> other parts of my job. (If anyone here has only one job, don't tell me;
> I'll just be jealous.)

No worries :)

Thanks,
Miklos
