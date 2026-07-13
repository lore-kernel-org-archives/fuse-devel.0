Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111041F09A8
	for <fuse-devel@lists.linux.dev>; Mon, 13 Jul 2026 22:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783980697; cv=pass; b=uhzN5aFqZubHPVxcXzwZiijroZy0Lvr/4S+4wRunfeWeeVB3mCCXKGsaFzRGicwYuy/fVxIzCwWXfEDullPbd9eOAzNWhpxkctEerPPHO+8+b8+95nE8gl9tilIzt7tU3b8fHJSoo2ZRya07aM/zGSqvUTaLpc4r9+g1ZAWAotw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783980697; c=relaxed/simple;
	bh=RYLqTn8lhEpoxphy0WxGRTYgZn3auH47Zx0QJMaEO54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eBqjyVUmQx6ungd5xtbZLQFWdlJgGHCS3yfMSm+TsOjkkB2BmfWlpNC2sgMYZlhwFr4HLyURPMKasAFDihzUIWQZwPzaf85ZinUU9k+4FPkgldkynWwjWGC0vfkajI+KjfKO+J+WuKwcmWcihBmBlQ9TPt+F4DShtEBKksxivN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rTIEAApe; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rTIEAApe"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493f2e39e81so14269555e9.2
        for <fuse-devel@lists.linux.dev>; Mon, 13 Jul 2026 15:11:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783980694; cv=none;
        d=google.com; s=arc-20260327;
        b=rtfP6mDUR2ZJriat2C1UE29IR9B32jBmTPGls2WZvjCRYCt92iNgOTCr7NyvSWaDpW
         YCz+YNenBRfUBd9NUyg/CpMUbxu68WtzVVG+/+Nx4ijQInom15PBtm8ILC95QUHK+fSP
         2o8BCPR1/9VV7iV6Cn4KJZ07BVIPbLJD97N4qZ3c8WwfwwJaBqxx7ScIIxPaOLR9ZJ+w
         YXtb3CjmhFYOGVXbCOZUHPtVbFp0pJVH5JF0nluK4uUIfPU2CSw8+tEo+rc+DSVUF7PD
         5aTEKOMClC9B2F86I9YezKUTHmZ17Qu5feFr4c/avjZmVUivZ+WtbbSYVaXfKriLsI8+
         cCVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RYLqTn8lhEpoxphy0WxGRTYgZn3auH47Zx0QJMaEO54=;
        fh=QinOkR/v+QSoOPiaAYElXOdlTqDkCgDAFawHHu9orEY=;
        b=bmM2Xbl4ujMvu2TXcTAZ857cgIaVaIy/Jx9TQ4MBFHURIQ8khucYEmq420K9OpeMvy
         hy4K8SXYsEttPs8zBZmUbVXmuuU08ZbqgfrGcbrA6OhbA5GzrZ6SGra1o5ZNBLd7ZbqK
         anL7mLqVc0xAMzBu1Txo4XbkLmIxr6Pzq9Rd8cBmC2MH36xRx3xVzqiaj21VD24/EWGb
         sj0x5JovAIVj3fGajlKoQmZPdxcOH3COKgTyf1XNn9Aq6mWyrFKamB2vVSTtdPD9SZjO
         dAv8MYqXE9ThRVdrAfDWk8+eLsgw4xqn0axZvDoAS8J+MgWYAukOVmli1g5T6DyvhAlD
         tdYA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783980694; x=1784585494; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RYLqTn8lhEpoxphy0WxGRTYgZn3auH47Zx0QJMaEO54=;
        b=rTIEAApes/Y63IL3k+/OIokpB1YcEqaXG56+FQNx6Pkg2lEnpLKwhQLD4lAs62maqC
         Tk8Hk2UHH3380PgevFbTgPbmNNuZjjvNec54Y2KS1LboGyCzYKz0uT3zacVhZ46t29IO
         xGNg2mIxJmXgHIvnKssQ6a453k7T6WF+y19BbdFsMChBVerlPPsHZQp8JUAD8i0jV+cV
         LMbri2EN6xQ4Cb3QY/uISXXK3+EQCbVVj5FgiQP7pKkJ8Y9QLPzErcw68YKIwivzD+zW
         9vhaK4RDuPyEkFGFqnJRfwCOB0IphTsWwa/yuMscF+F35elFKfcO8t0AZXZE21UamSbM
         TJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783980694; x=1784585494;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RYLqTn8lhEpoxphy0WxGRTYgZn3auH47Zx0QJMaEO54=;
        b=tPXOUBopi1A9wP7lXYXbMDSZQza5q4lJmTgXSQj4kifOlgXtcQRsZXQGTVIcOYNzWS
         AJm+ZozDezhYWlIL7MwiZgDwYTuiWQjMZ2W5vLA18OlC8IIFWfMXuLZxzZ2p2QeaS04C
         Yo7YnTyJRp4xLQhFomNzuSpCxx/tGdYqe2iAw/R1tF6/W5VDFiBlw0XEQOvMMR0pIBdd
         ScviBt9BL3pCneUgLkYGtlLJ4TSUfVovAOeT/umAHp8nCu/hpGZ9DSucJ1c2rJicNRKX
         LFUXOcuCGdPjludElixDXcIV0djHB0v54DtivGejx3pkJDHZO/w8EH8G0qb+oZSVc8sJ
         LEiw==
X-Gm-Message-State: AOJu0YzogUZKiHR+5vAgCSG/fHSLs06Hyzx7evdVNsYaQIDrnliIPcK4
	+KDy7JRkjnwA7SRsJH9KDqMn/ngUEfhoED0aS0N9kvYaQEbZJae6lJ6T2jU1ABl4HAB1FgBlr4t
	JsGygcFnd+kjZ2/YrJRYkaMNTCKIpJERZu7DLe8s=
X-Gm-Gg: AfdE7ck0xgzpWtZrYd4CQ8QluddJGDG9qHvccERre3hfMtkD+Oa1jLVcC3ni5DkMphe
	Di82l1L/Hcm/RX2Ml4BrfIJsRzQ2B2YgJLJcKB46/GabxpsdSpgDEToSRACKgxkaSA439v7XWRm
	4QpKJLzXgCEyU7yGMpH2tpj+JP1hcomPDJAXS9mxW35+MjVjPZUGQuObvCHddB9FnHfc5H1xm23
	eWx/QLG/tjp3oZ8ZY1MsDloiWu8rR7qx7zkOZOyBv7K+twHw6Q1CqnAnjB1y9gNaRWCVRPJ+AhA
	WWukic86WrNlXkuLGyZ1gRGSATphWQZTm4AOH1Bq3+xjYnyrdIbvpNIfKgZCRiZsuh7AjQ==
X-Received: by 2002:a05:6000:2006:b0:47d:edab:a721 with SMTP id
 ffacd0b85a97d-47f2dce9698mr12173493f8f.31.1783980694461; Mon, 13 Jul 2026
 15:11:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260713175345.2542331-1-joannelkoong@gmail.com>
In-Reply-To: <20260713175345.2542331-1-joannelkoong@gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 13 Jul 2026 15:11:22 -0700
X-Gm-Features: AUfX_my9JOM1Anjv8osAQkporAxxoHoY0M2kvYC4ypcjnle895hVIZpywcmiiHM
Message-ID: <CAJnrk1b9jjvP6a9PaYAiA0HZcJ0_dR_O2aGWPF44T2NNBJC94w@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] fuse: fix missing barriers in io-uring init
To: miklos@szeredi.hu, bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 10:54=E2=80=AFAM Joanne Koong <joannelkoong@gmail.c=
om> wrote:
>
> These are two pre-existing issues Sashiko reported [1] on the fuse zeroco=
py
> series.
>
> [1] https://sashiko.dev/#/patchset/20260630211436.2062816-1-joannelkoong%=
40gmail.com

Sashiko noted some other places that are also missing barriers [1].
Will send v2 to add these places as well.

[1] https://sashiko.dev/#/patchset/20260713175345.2542331-1-joannelkoong%40=
gmail.com
