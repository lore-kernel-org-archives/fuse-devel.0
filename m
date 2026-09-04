Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80D740B0ED
	for <fuse-devel@lists.linux.dev>; Fri,  4 Sep 2026 04:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788497840; cv=none; b=WnRhkSVKRFdS0YCc6oOwtRaqApBYfIAL365eJ2zPf19bMnm9kd+HZ+gmnR+ggMWsPsB9SGGVv0i5gsjLaSepxwtjUJHzr8oK0CTgjpFg45+UNFBlMXDwDBZ1Lc8NKfqejGeJzj8T4M97f9gT5A9tA6V6UP/MIwaBmCTiIqBtyHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788497840; c=relaxed/simple;
	bh=wf2eA4gQyNK9vLznX6JsMxWpb8/xuMD77ChghGMHkdE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UI12gaMreVA05Hnr6ao8izsHldu6CLsDxYjI4YxXdrDFgj12g/nEvuzCqInQOhnQPLVBc038q33dkIQXblRsGYNZgeRr6sQPGj9bsa+XI7ymwUE/35z7juZskaSV+tPONvR1rtQoHNR7KtbdY7ArUW867LCeWkOzNoWTQ/ekgFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b95QEDQm; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b95QEDQm"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6b128dd0cb1so356279eaf.3
        for <fuse-devel@lists.linux.dev>; Thu, 03 Sep 2026 21:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788497838; x=1789102638; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ENex+8PREJHwJYy6LB6k8548sjw67/cgp5h8Juk7F4Y=;
        b=b95QEDQmoAEghB7oxWM91+XQv8+bccu0zULOh9DClWuY8C0Npo9JvB6G1lQ0B3lkMt
         tsupZNJ6j/PaXXNd+CTAX8ch7CaYgkj3XZ2aaXi9Xd3Re97G4fHHSHA6HHOwxYFJJtQ2
         XY1r1Q59XQxxG6PthZu3t0lnCm0UtPTf0F9xRdRgg904AxUOMGN5aYPrzxUKenwFWLXm
         Hfbu2Si1vws5aBiip97vhYj44jHAMW0b9lJoDHIzSkN/82uvp0eIstXZ4C1vbHH1/r8P
         RzE2YArwd5KGyBvjei1+gUxco51rtu9T7UbMUawCsjANE1z/GDgGxX0/WxNVLm6Ndkeq
         mYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788497838; x=1789102638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ENex+8PREJHwJYy6LB6k8548sjw67/cgp5h8Juk7F4Y=;
        b=k5VbphkshHSB4BFAwfYloDA69tiuKY3mCcuP/4lCJhEe0PZH5gyX0gCR9mmGJlcOUQ
         +l21wtVaRIaXvfXV7l8YabP490YYTxtTLC0rGo0uPWyICD7KLVVZpk9tkZg70kjxxmyP
         83tVEvUg6X+F3aGPDYFoFqQ83Xdt0Fbo6QCivPYKBQYhC24qiGUX3uUIGxiTH6QD3/0O
         /1VLnDmMAz4fkxlLZrMiOUU7ZYy1ecI9xZl0cXP8sqwhqlIMp3nxdfACwOF07jJQy6mr
         z1cOqDc/faW5lwb5yoV1sRgZuwnDzP2CoUr3D1d+k4CjgIJst8ieIv/bDBbsahoLq5r/
         o19A==
X-Gm-Message-State: AFuF++lniPbacOP7ONGoUh+MHXVU6Ro1Stj0BfRhsi6QlckGNM3V7PjJ
	Hd4AU9nahbcmth6Yd9JLC3HOi9anP7aYlzC6Sq2K2z6sgmNBVrbtLRSc
X-Gm-Gg: AYBFou2VCyj0lt3jhYCkwCBcV4Qwb5kuJ/Wzq9/PrEm0F3WHi9euQ5cJ9CEKPvoHMkA
	2MxqOLyIzNmVCoqWOnrLa8aY0saB/4IL8O/uywx26k7kRJdhj0ywC7opxiEd6TZk10CAw+G0VEd
	CP1kYzz3YhSdr7m0dwuMfjn/SC90ZK9oi3oaWoHWkiwvqtVnhqgaljZL+/okZSKPMSgNZ2cQLsk
	K9PHiRzfiaWB7WEkJzp195d1Gu+CilzmX6x6JM6NNfiz3xoXbZwftcBEPewW0xHBtabFNEIA9zO
	T/+uZQVmBsj9nbrlElQSLbCFORws6RxC4EoOls3I8DvsETDzHGyR48tmn48oZ9nE4f2aSHKZXKC
	K9NOZP3vygSWn5ArkgLYp6ftmN1fekF+PTv7PXA7hidEs6e4FXVij9AfR/q2Z2TD811k70CY7o5
	i/soKvZ7irgD97HHWxDLXQXGaY+DXiIG8flbvVYDXAWJUBKLhXQ4C2gq2aQBIBKyge6tsXFFWhI
	hG0VnJaRNPJavxJdnRR0gMJQhbrrbSJ7ikRq1Mb
X-Received: by 2002:a4a:ee05:0:b0:6ae:aa38:a0aa with SMTP id 006d021491bc7-6b6fe2af974mr3184863eaf.32.1788497832985;
        Thu, 03 Sep 2026 21:57:12 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:5a::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dd57198esm2283572eaf.11.2026.09.03.21.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 21:57:11 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev
Subject: [PATCH v1 0/2] fuse: fixes for iomap bugs reported by Sashiko
Date: Thu,  3 Sep 2026 21:56:49 -0700
Message-ID: <20260904045651.1442505-1-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are two patches fixing iomap bugs reported by Sashiko. They are intended
for the next v7.3 -rc cycle.

A separate backport patch will be submitted to stable for the 2nd patch (zero
the correct range on a short read reply), since otherwise there are merge
conflicts.

Thanks,
Joanne

Joanne Koong (2):
  fuse: don't shorten the folio descriptor at LLONG_MAX
  fuse: zero the correct range on a short read reply

 fs/fuse/dev.c    | 44 +++++++++++++++++++-------------------------
 fs/fuse/dev.h    |  2 +-
 fs/fuse/file.c   | 38 +++++++++++++++++++++++++++++---------
 fs/fuse/notify.c |  2 +-
 4 files changed, 50 insertions(+), 36 deletions(-)

-- 
2.52.0

